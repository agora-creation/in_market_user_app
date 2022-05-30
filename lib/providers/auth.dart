import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/user.dart';
import 'package:in_market_user_app/services/shop.dart';
import 'package:in_market_user_app/services/user.dart';

enum Status { authenticated, uninitialized, authenticating, unauthenticated }

class AuthProvider with ChangeNotifier {
  Status _status = Status.uninitialized;
  Status get status => _status;
  FirebaseAuth? auth;
  User? _fUser;
  UserService userService = UserService();
  ShopService shopService = ShopService();
  UserModel? _user;
  UserModel? get user => _user;
  ShopModel? _currentShop;
  ShopModel? get currentShop => _currentShop;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController telController = TextEditingController();

  void clearController() {
    emailController.text = '';
    passwordController.text = '';
    rePasswordController.text = '';
    nameController.text = '';
    zipController.text = '';
    addressController.text = '';
    telController.text = '';
  }

  AuthProvider.initialize() : auth = FirebaseAuth.instance {
    auth?.authStateChanges().listen(_onStateChanged);
  }

  Future<String?> login() async {
    String? errorText;
    if (emailController.text.isEmpty) errorText = 'メールアドレスを入力してください。';
    if (passwordController.text.isEmpty) errorText = 'パスワードを入力してください。';
    try {
      _status = Status.authenticating;
      notifyListeners();
      await auth?.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      _status = Status.unauthenticated;
      notifyListeners();
      errorText = 'ログインに失敗しました。';
    }
    return errorText;
  }

  Future<String?> regist() async {
    String? errorText;
    if (emailController.text.isEmpty) errorText = 'メールアドレスを入力してください。';
    if (passwordController.text.isEmpty) errorText = 'パスワードを入力してください。';
    if (passwordController.text != rePasswordController.text) {
      errorText = 'パスワードをご確認ください。';
    }
    if (nameController.text.isEmpty) errorText = 'お名前を入力してください。';
    try {
      _status = Status.authenticating;
      notifyListeners();
      await auth
          ?.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        String id = randomString(20);
        List<Map> addressList = [];
        addressList.add({
          'id': id,
          'name': nameController.text.trim(),
          'zip': zipController.text.trim(),
          'address': addressController.text.trim(),
          'tel': telController.text.trim(),
        });
        userService.create({
          'id': value.user?.uid,
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'name': nameController.text.trim(),
          'addressList': addressList,
          'token': '',
          'createdAt': DateTime.now(),
        });
      });
    } catch (e) {
      _status = Status.unauthenticated;
      notifyListeners();
      errorText = '登録に失敗しました。';
    }
    return errorText;
  }

  Future logout() async {
    await auth?.signOut();
    _status = Status.unauthenticated;
    _user = null;
    _currentShop = null;
    await removePrefs('userId');
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future reloadUser() async {
    _user = await userService.select(id: _fUser?.uid);
    if (_user?.shopId != '') {
      _currentShop = await shopService.select(id: _user?.shopId);
    }
    notifyListeners();
  }

  Future _onStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
    } else {
      _fUser = firebaseUser;
      _status = Status.authenticated;
      _user = await userService.select(id: _fUser?.uid);
      if (_user?.shopId != '') {
        _currentShop = await shopService.select(id: _user?.shopId);
      }
    }
    notifyListeners();
  }

  Future<List<ShopModel>> selectShops() async {
    return await shopService.selectList();
  }

  Future<String?> updateShop({ShopModel? shop}) async {
    String? errorText;
    if (shop == null) errorText = '店舗の選択に失敗しました。';
    try {
      userService.update({
        'id': user?.id,
        'shopId': shop?.id,
      });
      _currentShop = shop;
    } catch (e) {
      errorText = '店舗の選択に失敗しました。';
    }
    notifyListeners();
    return errorText;
  }
}

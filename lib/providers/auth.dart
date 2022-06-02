import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_market_user_app/helpers/functions.dart';
import 'package:in_market_user_app/models/cart.dart';
import 'package:in_market_user_app/models/shop.dart';
import 'package:in_market_user_app/models/shop_item.dart';
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

  void setController() {
    emailController.text = _user?.email ?? '';
    nameController.text = _user?.name ?? '';
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

  Future<String?> updateName() async {
    String? errorText;
    if (nameController.text.isEmpty) errorText = 'お名前を入力してください。';
    try {
      userService.update({
        'id': _user?.id,
        'name': nameController.text.trim(),
      });
    } catch (e) {
      errorText = 'お名前の更新に失敗しました。';
    }
    return errorText;
  }

  Future<String?> updateEmail() async {
    String? errorText;
    if (emailController.text.isEmpty) errorText = 'メールアドレスを入力してください。';
    try {
      await auth?.currentUser
          ?.updateEmail(emailController.text.trim())
          .then((value) {
        userService.update({
          'id': _user?.id,
          'email': emailController.text.trim(),
        });
      });
    } catch (e) {
      errorText = 'メールアドレスの更新に失敗しました。';
    }
    return errorText;
  }

  Future<String?> updatePassword() async {
    String? errorText;
    if (passwordController.text.isEmpty) errorText = 'パスワードを入力してください。';
    if (passwordController.text != rePasswordController.text) {
      errorText = 'パスワードをご確認ください。';
    }
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: _user?.email ?? '',
        password: _user?.password ?? '',
      );
      await auth?.signInWithCredential(credential);
      await auth?.currentUser
          ?.updatePassword(passwordController.text.trim())
          .then((value) {
        userService.update({
          'id': _user?.id,
          'password': passwordController.text.trim(),
        });
      });
    } catch (e) {
      errorText = 'パスワードの更新に失敗しました。';
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

  Future<String?> deleteShop() async {
    String? errorText;
    try {
      userService.update({
        'id': user?.id,
        'shopId': '',
      });
      _currentShop = null;
    } catch (e) {
      errorText = '店舗の選択に失敗しました。';
    }
    notifyListeners();
    return errorText;
  }

  int quantity = 1;

  void addQuantity() {
    quantity += 1;
    notifyListeners();
  }

  void removeQuantity() {
    if (quantity > 0) {
      quantity -= 1;
    }
    notifyListeners();
  }

  void setQuantity({required ShopItemModel item}) {
    quantity = 1;
    for (CartModel cart in user?.cartList ?? []) {
      if (cart.id == item.id) {
        quantity = cart.quantity;
      }
    }
  }

  Future<String?> addCart({required ShopItemModel item}) async {
    String? errorText;
    try {
      List<Map> cartList = [];
      bool addFlg = true;
      for (CartModel cart in user?.cartList ?? []) {
        if (cart.id == item.id) {
          cart.quantity = quantity;
          addFlg = false;
        }
        cartList.add(cart.toMap());
      }
      if (addFlg == true) {
        cartList.add({
          'id': item.id,
          'number': item.number,
          'name': item.name,
          'price': item.price,
          'unit': item.unit,
          'imageUrl': item.imageUrl,
          'quantity': quantity,
        });
      }
      userService.update({
        'id': user?.id,
        'cartList': cartList,
      });
      _user = await userService.select(id: user?.id);
    } catch (e) {
      errorText = 'カートの追加に失敗しました。';
    }
    notifyListeners();
    return errorText;
  }

  Future<String?> clearCart() async {
    String? errorText;
    try {
      userService.update({
        'id': user?.id,
        'cartList': [],
      });
      _user = await userService.select(id: user?.id);
    } catch (e) {
      errorText = 'カートのリセットに失敗しました。';
    }
    notifyListeners();
    return errorText;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_market_user_app/models/address.dart';
import 'package:in_market_user_app/models/cart.dart';

class UserModel {
  String _id = '';
  String _email = '';
  String _password = '';
  String _name = '';
  List<AddressModel> addressList = [];
  String _shopId = '';
  List<CartModel> cartList = [];
  String _token = '';
  DateTime _createdAt = DateTime.now();

  String get id => _id;
  String get email => _email;
  String get password => _password;
  String get name => _name;
  String get shopId => _shopId;
  String get token => _token;
  DateTime get createdAt => _createdAt;

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _id = snapshot.data()!['id'] ?? '';
    _email = snapshot.data()!['email'] ?? '';
    _password = snapshot.data()!['password'] ?? '';
    _name = snapshot.data()!['name'] ?? '';
    addressList = _convertList(snapshot.data()!['addressList']);
    _shopId = snapshot.data()!['shopId'] ?? '';
    cartList = _convertList2(snapshot.data()!['cartList']);
    _token = snapshot.data()!['token'] ?? '';
    _createdAt = snapshot.data()!['createdAt'].toDate() ?? DateTime.now();
  }

  List<AddressModel> _convertList(List list) {
    List<AddressModel> converted = [];
    for (Map data in list) {
      converted.add(AddressModel.fromMap(data));
    }
    return converted;
  }

  List<CartModel> _convertList2(List list) {
    List<CartModel> converted = [];
    for (Map data in list) {
      converted.add(CartModel.fromMap(data));
    }
    return converted;
  }
}

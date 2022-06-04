import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_market_user_app/models/cart.dart';

class ShopOrderModel {
  String _id = '';
  String _shopId = '';
  String _shopName = '';
  String _userId = '';
  String _userName = '';
  List<CartModel> cartList = [];
  String _zip = '';
  String _address = '';
  String _tel = '';
  int _status = 0;
  DateTime _createdAt = DateTime.now();

  String get id => _id;
  String get shopId => _shopId;
  String get shopName => _shopName;
  String get userId => _userId;
  String get userName => _userName;
  String get zip => _zip;
  String get address => _address;
  String get tel => _tel;
  int get status => _status;
  DateTime get createdAt => _createdAt;

  ShopOrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _id = snapshot.data()!['id'] ?? '';
    _shopId = snapshot.data()!['shopId'] ?? '';
    _shopName = snapshot.data()!['shopName'] ?? '';
    _userId = snapshot.data()!['userId'] ?? '';
    _userName = snapshot.data()!['userName'] ?? '';
    cartList = _convertList(snapshot.data()!['cartList'] ?? []);
    _zip = snapshot.data()!['zip'] ?? '';
    _address = snapshot.data()!['address'] ?? '';
    _tel = snapshot.data()!['tel'] ?? '';
    _status = snapshot.data()!['status'] ?? 0;
    _createdAt = snapshot.data()!['createdAt'].toDate() ?? DateTime.now();
  }

  List<CartModel> _convertList(List list) {
    List<CartModel> converted = [];
    for (Map data in list) {
      converted.add(CartModel.fromMap(data));
    }
    return converted;
  }

  String statusText() {
    String ret = '';
    switch (_status) {
      case 0:
        ret = '配達済み';
        break;
      case 1:
        ret = '受注待ち';
        break;
      case 2:
        ret = '配達待ち';
        break;
    }
    return ret;
  }
}

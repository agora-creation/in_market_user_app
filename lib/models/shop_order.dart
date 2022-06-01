import 'package:cloud_firestore/cloud_firestore.dart';

class ShopOrderModel {
  String _id = '';
  String _shopId = '';
  String _shopName = '';
  String _userId = '';
  String _userName = '';
  List cart = [];
  String _zip = '';
  String _address = '';
  String _tel = '';
  //配達済み、受注待ち、配達待ち、キャンセル
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
    _zip = snapshot.data()!['zip'] ?? '';
    _address = snapshot.data()!['address'] ?? '';
    _tel = snapshot.data()!['tel'] ?? '';
    _status = snapshot.data()!['status'] ?? 0;
    _createdAt = snapshot.data()!['createdAt'].toDate() ?? DateTime.now();
  }
}

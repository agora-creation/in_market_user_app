import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  String _id = '';
  String _email = '';
  String _password = '';
  String _name = '';
  String _token = '';
  DateTime _createdAt = DateTime.now();

  String get id => _id;
  String get email => _email;
  String get password => _password;
  String get name => _name;
  String get token => _token;
  DateTime get createdAt => _createdAt;

  ShopModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _id = snapshot.data()!['id'] ?? '';
    _email = snapshot.data()!['email'] ?? '';
    _password = snapshot.data()!['password'] ?? '';
    _name = snapshot.data()!['name'] ?? '';
    _token = snapshot.data()!['token'] ?? '';
    _createdAt = snapshot.data()!['createdAt'].toDate() ?? DateTime.now();
  }
}

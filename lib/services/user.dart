import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_market_user_app/models/user.dart';

class UserService {
  final String _collection = 'user';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void create(Map<String, dynamic> values) {
    _firebaseFirestore.collection(_collection).doc(values['id']).set(values);
  }

  void update(Map<String, dynamic> values) {
    _firebaseFirestore.collection(_collection).doc(values['id']).update(values);
  }

  void delete(Map<String, dynamic> values) {
    _firebaseFirestore.collection(_collection).doc(values['id']).delete();
  }

  Future<UserModel?> select({String? id}) async {
    UserModel? user;
    await _firebaseFirestore
        .collection(_collection)
        .doc(id)
        .get()
        .then((value) {
      user = UserModel.fromSnapshot(value);
    });
    return user;
  }
}

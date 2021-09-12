import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zorex_food/scr/models/user.dart';

class UserServices {
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values['id'];
    _firestore.collection(collection).doc(id).set(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    _firestore.collection(collection).doc(values['id']).update(values);
  }

  // ignore: missing_return
  Future<UserModel> getUserById(String id) {
    _firestore.collection(collection).doc(id).get().then((doc) {
      return UserModel.fromSnapshot(doc);
    });
  }
}

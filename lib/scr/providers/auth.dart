// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zorex_food/scr/helpers/user.dart';
import 'package:zorex_food/scr/models/user.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  // getters

  Status get status => _status;
  User get user => _user;
  UserModel get userModel => _userModel;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }
  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((user) {
        Map<String, dynamic> values = {
          'name': name.text,
          'email': email.text,
          'id': user.user.uid,
        };
        _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Uninitialized;
    } else {
      _user = user;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);

      notifyListeners();
    }
  }

  // general methods

  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print('we got an error : $error');
    return false;
  }

  void clearControllers() {
    email.text = '';
    password.text = '';
    name.text = '';
  }
}

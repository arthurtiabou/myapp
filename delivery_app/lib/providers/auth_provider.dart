// 📁 lib/providers/auth_provider.dart
//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

/*class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  User? _user;
  String? _role;

  User? get user => _user;
  String? get role => _role;

  bool get isLoggedIn => _user != null;

  Future<void> login(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    _user = result.user;

    final userDoc = await _firestore.collection('users').doc(_user!.uid).get();
    _role = userDoc.data()?['role'] ?? 'livreur';

    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user = null;
    _role = null;
    notifyListeners();
  }

  void loadUser() async {
    _user = _auth.currentUser;
    if (_user != null) {
      final userDoc = await _firestore.collection('users').doc(_user!.uid).get();
      _role = userDoc.data()?['role'];
    }
    notifyListeners();
  }
}*/

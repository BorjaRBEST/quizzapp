import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:quizzapp/models/usuarios_model.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  Usuario? _usuario;

  User? get user => _user;
  Usuario? get usuario => _usuario;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    if (_user != null) {
      await _loadUsuario(_user!.uid);
    } else {
      _usuario = null;
    }
    notifyListeners();
  }

  Future<void> _loadUsuario(String uid) async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();
    if (userDoc.exists) {
      _usuario = Usuario.fromFirestore(
          userDoc.data() as Map<String, dynamic>, userDoc.id);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

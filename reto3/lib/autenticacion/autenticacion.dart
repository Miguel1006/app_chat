import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth _fire = FirebaseAuth.instance;
  User? get usuarios => _fire.currentUser;
  Stream<User?> get estadoAutenticacion => _fire.authStateChanges();

  Future<void> IniciarSesion(
      {required String email, required String password}) async {
    try {
      await _fire.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> CrearUsuario(
      {required String email, required String password}) async {
    try {
      await _fire.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> CerrarSesion() async {
    try {
      await _fire.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}

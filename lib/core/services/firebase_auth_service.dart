import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Реєстрація
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Sign up error: $e");
      rethrow;
    }
  }

  // Вхід
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Sign in error: $e");
      rethrow;
    }
  }

  // Вихід
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Перевірка авторизації
  Stream<User?> get userChanges => _auth.authStateChanges();
}

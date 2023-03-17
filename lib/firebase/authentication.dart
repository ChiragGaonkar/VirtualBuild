import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Map<String, dynamic> tellMeTheError(String error) {
    print("Error Message  ${error}");
    switch (error) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return {"error": "Email already used. Go to login page."};
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return {"error": "Wrong email/password combination."};
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return {"error": "No user found with this email."};
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return {"error": "User disabled."};
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return {"error": "Too many requests to log into this account."};
      case "ERROR_OPERATION_NOT_ALLOWED":
        return {"error": "Server error, please try again later."};
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return {"error": "Email address is invalid."};
      default:
        return {"error": "Login failed. Please try again."};
    }
  }

  Future<Map<String, dynamic>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    //final prefs = await SharedPreferences.getInstance();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return {};
    } on FirebaseAuthException catch (e) {
      return tellMeTheError(e.code);
    }
  }

  Future<Map<String, dynamic>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return {};
    } on FirebaseAuthException catch (e) {
      return tellMeTheError(e.code);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> checkIfEmailInUse({required String email}) async {
    final list = await _firebaseAuth.fetchSignInMethodsForEmail(email);
    if (list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> resetPassword({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      print("Passwrod Reset Sucessfully");
      return {};
    } on FirebaseAuthException catch (e) {
      return tellMeTheError(e.code);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService extends GetxService {

  final _auth = FirebaseAuth.instance;

  Future<void> registerCredential (
    final String email, 
    final String password, 
    final Function(UserCredential) onCreate,
    final Function(User?) onCreated,
    final Function(String?) onSuccess,
    final Function(FirebaseAuthException) onFirebaseAuthException,
    final Function(Exception) onException,
  ) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword (
        email: email, password: password,
      );
      onCreate(userCredential);
      final User? user = userCredential.user;
      onCreated(user);
      onSuccess(user?.uid);
    } on FirebaseAuthException catch (exception) {
      onFirebaseAuthException(exception);
    } catch (exception) {
      onException(throw Exception("FirebaseAuthService registerCredential exception ${exception.toString()}}"));
    }
  }

   Future<void> sendEmailVerification (
    final Function() onSuccess,
    final Function(String) onFirebaseAuthException,
    final Function(String) onException,
   ) async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (exception) {
      onFirebaseAuthException("FirebaseAuthException sendEmailVerification ${exception.code} ${exception.message}");
    } catch (exception) {
      onException("FirebaseAuthService sendEmailVerification exception ${exception.toString()}");
    }
  }

  Future<void> checkCredential (
    final String email, 
    final String password,
    final Function(UserCredential) onProcess,
    final Function() onSuccess,
    final Function(String) onException,
    final Function() onFinally,
  ) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword (
        email: email, 
        password: password
      );
      onProcess(credential);
      onSuccess();
    } catch (exception) {
      onException("FirebaseAuthService checkCredential exception ${exception.toString()}}");
    } finally {
      onFinally();
    }
  }

  User? getUser() {
    return _auth.currentUser;
  }

  bool isUserSignedIn() {
    return getUser() != null ? true : false;
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
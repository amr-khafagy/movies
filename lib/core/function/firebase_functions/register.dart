import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseUsage {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late UserCredential userCredential;

  Future<User?> register(String email, String password, String username) async {
    userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      if(user.emailVerified){
        await firestore
            .collection("users")
            .doc(user.uid)
            .set({'username': username});
        return user;
      }
    }
    return null;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  Future<User?>signInwithFacebook() async{
    final FacebookAuth facebookAuth = FacebookAuth.instance;

    try{
      final LoginResult loginResult=await facebookAuth.login();
      if(loginResult.status==LoginStatus.success){
        final AuthCredential credential=FacebookAuthProvider.credential(loginResult.accessToken!.token);
        userCredential=await auth.signInWithCredential(credential);
        return userCredential.user;
      }else{
        print('Facebook Sign-In failed.');
        return null;
      }
    }catch(e){
      print(e.toString());
      return null;
    }
}
  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }
}

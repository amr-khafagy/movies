import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/core/services/services.dart';

class FireBaseUsage {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late UserCredential userCredential;
  MyServices myServices = Get.find();
  List toWatchList = [];

  Future<User?> register(String email, String password, String username) async {
    userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      await firestore
          .collection("users")
          .doc(user.uid)
          .set({'username': username});
      return user;
    }
    return null;
  }

  Future<User?> addTowatchList(int seriesID) async {
    await firestore.collection("users").doc(auth.currentUser!.uid).update({
      'seriesID': FieldValue.arrayUnion([seriesID])
    });
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

  Future resetPassword(String newPassword) async {
    try {
      User? user = auth.currentUser;
      await user?.updatePassword(newPassword);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> getWatchList() async {
    final DocumentReference documentRef = firestore.collection('users').doc(
        auth.currentUser!.uid);
    final watchList = await (await documentRef.get()).get('seriesID');
    return watchList;
  }

  Future<void> deletefromWatchList(int seriesID) async {
    final DocumentReference documentRef = firestore.collection('users').doc(
        auth.currentUser!.uid);
    final watchList =await documentRef.update(
        { 'seriesID': FieldValue.arrayRemove([seriesID])
        });
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

  Future<User?> signInwithFacebook() async {
    final FacebookAuth facebookAuth = FacebookAuth.instance;

    try {
      final LoginResult loginResult = await facebookAuth.login();
      if (loginResult.status == LoginStatus.success) {
        final AuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
        userCredential = await auth.signInWithCredential(credential);
        return userCredential.user;
      } else {
        print('Facebook Sign-In failed.');
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }

  Future sendPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }
}

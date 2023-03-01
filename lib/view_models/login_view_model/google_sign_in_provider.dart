import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:re3ya_care/view/screens/splash/splash_screen.dart';
import '../../view/customs/navigator.dart';
import '../../view/screens/main_screen/bottom_navigation.dart';

class GoogleSignInProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  String name = "";
  String? photo;
  String? mail;
  bool isSignedIn = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      name = '';
      photo = '';
      isSignedIn = false;

      notifyListeners();
      Navigators.moveTo(SplashScreen());
    } catch (error) {
      print("error");
    }
  }

  Future<void> googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      name = googleUser!.displayName!;
      photo = googleUser.photoUrl!;
      mail = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      notifyListeners();

      Navigators.moveTo(() => BottomNavigation());
    } catch (error) {
      print("error is $error");
    }
  }
}

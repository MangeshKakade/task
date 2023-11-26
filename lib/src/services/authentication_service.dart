import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
        );
        await _auth.signInWithCredential(credential);
      }
    } catch (error) {
      print('Google Sign-In Error: $error');
    }
  }

  Future<void> handleSignOut() async{
    try{
      await _googleSignIn.signOut();
      await _auth.signOut();
    }catch (e){
      print("error signing out:$e");
    }
  }

}
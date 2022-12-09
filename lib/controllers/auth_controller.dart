import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../controllers/auth_controller.dart';
import '../firebase_ref/references.dart';
import '../widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController{

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?>_authStateChanges;


  void initAuth() async{
   await Future.delayed(const Duration(seconds:2));
   _auth = FirebaseAuth.instance;
   _authStateChanges = _auth.authStateChanges();
   _authStateChanges.listen((User? user) {
     _user.value = user;
   });
  navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if(account != null){
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );
        await _auth.signInWithCredential(_credential);
       await saveUser(account);
      }
    } on Exception catch(error) {
      print(error);
      //AppLogger.e(errpr);
    }
  }
  saveUser( GoogleSignInAccount account){
  userRF.doc(account.email).set({
    "email" : account.email,
    "name" : account.displayName,
    "profilepic" : account.photoUrl,
  });
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
  
  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialog(onTap: () {
      Get.back();
      //Navigate to Login Page
    }),
    barrierDismissible: false);
  }

  bool isLoggedIn() {
    _auth.currentUser != null;
  }
}
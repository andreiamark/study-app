import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/screens/login/login_screen.dart';
import '../controllers/auth_controller.dart';
import '../firebase_ref/references.dart';
import '../screens/home/home_screen.dart';
import '../widgets/dialogs/dialogue_widget.dart';
import 'app_logger.dart';

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

  Future<void> signInWithGoogle() async {
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
       navigateToHomePage();
      }
    } on Exception catch(error) {
      AppLogger.e(error);
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }
  saveUser( GoogleSignInAccount account){
  userRF.doc(account.email).set({
    "email" : account.email,
    "name" : account.displayName,
    "profilepic" : account.photoUrl,
  });
  }

  void signOut() async {
    AppLogger.d('Sign out');
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
  navigateToHomePage(){
    Get.offAllNamed(HomeScreen.routeName);
  }
  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialog(onTap: () {
      Get.back();
      NavigateToLoginPage();
    }),
    barrierDismissible: false);
  }

 void NavigateToLoginPage(){
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

}
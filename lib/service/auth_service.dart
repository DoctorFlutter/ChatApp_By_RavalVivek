import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/service/databse_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login
  Future loginWithUserNameAndPassword(String email, String password) async {
    try {
      final user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password))
          .user;

      if(user != null){
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }
  //register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      final user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if(user != null){
        // call database service to update data
        
        DatabaseService(uid: user.uid).SavingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  //sign out

  Future signOut() async{
    try{
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");

      await firebaseAuth.signOut();
    }catch(e)
    {
      return null;
    }
  }
}

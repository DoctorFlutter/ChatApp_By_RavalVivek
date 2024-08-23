import 'package:chat_app/auth/login_page.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'helper/helper_function.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn =false;

  void initState(){
    super.initState();
    getUserLoggedInStatus();
  }
  getUserLoggedInStatus()async{
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if(value !=null){
        setState((){
          _isSignedIn =value;
        });

      }
    });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:  Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home:  _isSignedIn ?const HomePage():const LoginPage(),
    );
  }
}

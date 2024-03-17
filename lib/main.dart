import 'package:cardapio/pages/main/main_page.dart';
import 'package:cardapio/pages/login/login_page.dart';
// import 'package:cardapio/pages/login/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {

  var options = const FirebaseOptions(
    apiKey: "AIzaSyBW7MY11uCarJcF2rCBecDdCte2XQr31iw",
    authDomain: "cardapio-94190.firebaseapp.com",
    projectId: "cardapio-94190",
    storageBucket: "cardapio-94190.appspot.com",
    messagingSenderId: "202563324029",
    appId: "1:202563324029:web:5bfa99f0412b9180e6c914",
    measurementId: "G-W4LEK7G6YY"
  );
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: options);

  if (kIsWeb){
    await Firebase.initializeApp(options: options);
  } else  {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardápio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 45, 139, 167)),
        useMaterial3: true,
      ),
      // home: MainPage()
      home: LoginPage()
      // home: const SignUpPage(),
      
    );
  }
}
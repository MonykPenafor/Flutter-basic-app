// import 'dart:html';

import 'package:cardapio/models/user_local.dart';
import 'package:cardapio/pages/main/main_page.dart';
import 'package:cardapio/pages/login/signup_page.dart';
import 'package:cardapio/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final UserLocal _userLocal = UserLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return MainPage();
          } else{
            
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(10),
                  //   child: Image.asset(
                  //     'assets/images/capa.png', 
                  //     height: 100, 
                  //     width: 150, 
                  //     fit: BoxFit.fill,)
                  // ),
            
                  const Text('Welcome back my friend!', style: TextStyle(color: Color.fromARGB(255, 41, 41, 41), fontSize: 35, fontWeight: FontWeight.bold),),
            
                  const Text('Cardápio', style: TextStyle(color: Color.fromARGB(255, 82, 164, 202), fontSize: 20),),
            
                  const SizedBox(height: 25,),
            
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text("E-mail do usuário"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.2)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.7)
                      )
                    ),
                  ),
            
                  const SizedBox(height: 10,),
            
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint),
                      label: Text("Senha"),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.3),
                        // borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5)
                      )
                    ),
                  ),
            
                  // const SizedBox(height: 10,),
            
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const Text(
                      'Esqueceu a senha?', 
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 40,),
            
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed:() async {
                          UserServices userServices = UserServices();
                          _userLocal.email = _emailController.text;
                          _userLocal.password = _passwordController.text;
            
                          Future<bool> ok = userServices.signIn(
                            _userLocal.email.toString(), 
                            _userLocal.password.toString());
            
                          if (await ok){
                            Navigator.push(context, MaterialPageRoute(builder:(context) => MainPage(),));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 1.5,
                          minimumSize: const Size.fromHeight(50),
                          shape: LinearBorder.bottom()),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ),
                    ],
                  ),
            
            
                  const SizedBox(height: 25,),
            
            
                  const Center(
                    child: Text(
                      'Ou',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        
                      ),
                    ),
                  ),
            
            
                  const SizedBox(height: 25,),
            
                  
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo_google.png', height: 40,),
                          const SizedBox(width: 15,),
                          const Text(
                            'Login com Google',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            
            
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Ainda não tem conta?', style: TextStyle(color: Color.fromARGB(255, 34, 34, 34), fontWeight: FontWeight.bold,),),
            
                        const SizedBox(width: 5,),
            
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                          },
                          child: const Text('Registre-se', style: TextStyle(color: Color.fromARGB(255, 6, 135, 221), fontWeight: FontWeight.bold,),),
            
                        ),
            
            
                        
                    ],)
                    
                    
                    
                  ),
            
            
            
            
                ],
              ),
            );
          }
        }),);
  }
}
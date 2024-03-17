// import 'dart:html';

import 'package:cardapio/models/user_local.dart';
import 'package:cardapio/services/user_services.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController birthdayController = TextEditingController(); // é date
  TextEditingController phoneController = TextEditingController();
  // TextEditingController imageController = TextEditingController();
  
  UserLocal user = UserLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
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


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('segunda tela', style: TextStyle(color:  Color.fromARGB(255, 41, 41, 41), fontSize: 20, fontWeight: FontWeight.bold),),

                    Text('Cardápio', style: TextStyle(color: Color.fromARGB(255, 82, 164, 202), fontSize: 15),),
                  ],

                ),

                // const SizedBox(width: 80,),

                Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/foto_perfil.jpg',
                        height: 50, 
                        width: 50, 
                        fit: BoxFit.fill,)
                    ),
                  ],

                ),
              ],
            ),



            const SizedBox(height: 15,),

            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                label: Text("Nome do usuário"),
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
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                label: Text("E-mail"),
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
              controller: phoneController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                label: Text("Telefone"),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.7)
                )
              ),
            ),

            const SizedBox(height: 10,),

            // TextFormField(
            //   controller: birthdayController,
            //   decoration: const InputDecoration(
            //     prefixIcon: Icon(Icons.calendar_month),
            //     label: Text("Data de Nascimento"),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(width: 1.2)
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(width: 1.7)
            //     )
            //   ),
            // ),

            // const SizedBox(height: 10,),
       
            TextFormField(
              obscureText: true,
              controller: passwordController,
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

            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed:(){

                    //utilizando obj DTO
                    user.userName = userNameController.text;
                    user.email = emailController.text;
                    user.password = passwordController.text;
                    user.phone = phoneController.text;
                    // user.image = imageController.text

                    //criando instancia da classe userservice
                    UserServices userServices = UserServices();

                    //utilizando instancia da classe user service
                    userServices.signUp(
                      user.userName.toString(), 
                      user.email.toString(), 
                      user.password.toString(), 
                      user.phone.toString());

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1.5,
                    minimumSize: const Size.fromHeight(50),
                    shape: LinearBorder.bottom()),
                  child: const Text(
                    'Registrar',
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Já tem uma conta?', style: TextStyle(color: Color.fromARGB(255, 34, 34, 34), fontWeight: FontWeight.bold,),),

                  SizedBox(width: 5,),
                  
                  Text('Login', style: TextStyle(color: Color.fromARGB(255, 6, 135, 221), fontWeight: FontWeight.bold,),),
              ],)
              
              
              
            ),




          ],
        ),
      ),

    );
  }
}
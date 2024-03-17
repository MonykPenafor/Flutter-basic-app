import 'package:cardapio/models/user_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServices{

  //widget para autenticação de usuario
  FirebaseAuth _auth = FirebaseAuth.instance;

  //widget para persistencia de dados do usuario
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserLocal? _userLocal = UserLocal(); //'?' nullsafety pq nao vai ser inicializada agora e sim dinamicamente

  // metodo do tipo get para obter uma referencia da coleção no firebase
  CollectionReference get _collectionRef => _firestore.collection("users");

  //metodo para obter a referencia do documento no firebase
  DocumentReference get _docRef => _firestore.doc('users/${_userLocal!.id}');

  //metodo de registro de usuario no firebase
  signUp(String userName, String email, String password, String phone,) async { //DateTime bday,String image
    User? user = (await  _auth.createUserWithEmailAndPassword(
      email: email, 
      password: password)).user;      

    _userLocal!.id = user!.uid;
    _userLocal!.email = user.email;
    _userLocal!.userName = userName; 
    _userLocal!.phone = phone;

    saveData();

  }

  //metodo para persistir dados do usuario no firebase firestore
  saveData() {
    _docRef.set(_userLocal!.toJson());

  }


  Future<bool> signIn(String email, String password,) async {
    try{
      _auth.signInWithEmailAndPassword(email: email, password: password);
      return Future.value(true);

    } on FirebaseAuthException catch(e){
      debugPrint(e.toString());
      return Future.value(false);
    }



  }
    
    
}






  // signUp(String userName, String email, String password, String phone) async { 
  //   try {
  //     await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     print('User created successfully'); // Adicionando um print para saber se o usuário foi criado com sucesso
  //   } catch (e) {
  //     print('Error creating user: $e'); // Adicionando um print para exibir o erro caso ocorra algum problema
  //   }
  // }


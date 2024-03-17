

import 'package:cardapio/models/commodity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommodityServices{
  //obter uma referencia do firebase (cloudstore)
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // obtendo a referencia da coleção commodities no firebase
  CollectionReference _collectionRef = FirebaseFirestore.instance.collection('commodities');

  //metodo para salvar/persistir dados no firebase
  addCommodity(Commodity commodity){
    _firestore.collection('commodities').add(commodity.toJson());

  }

  //usando a referencia da coleção diretamente
  addCommodity2(Commodity commodity){
    _collectionRef.add(commodity.toJson());
  }


}
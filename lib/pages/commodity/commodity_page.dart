
import 'package:cardapio/models/commodity.dart';
import 'package:cardapio/services/commodity_services.dart';
import 'package:flutter/material.dart';

class CommodityPage extends StatelessWidget {
  CommodityPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  Commodity commodity = Commodity();
  CommodityServices commodityServices = CommodityServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('data'),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _openDialog(context);
        },
        child: const Text('+', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
      ),
    );
  }


  _openDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('add commodity'),
        content: Container(
          height: 200,
          width: 250,
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Nome'),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),

              const SizedBox(height: 10,),

              TextField(
                controller: _typeController,
                decoration: const InputDecoration(hintText: 'Tipo'),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
        ),

        actions: [
          TextButton(
            onPressed: (){
              
              _nameController.clear();
              _typeController.clear();

              Navigator.of(context).pop();      
            }, 
            child: const Text('cancelar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),)),
          TextButton(
            onPressed: (){
              commodity.name = _nameController.text;
              commodity.type = _typeController.text;

              _nameController.clear();
              _typeController.clear();

              commodityServices.addCommodity(commodity);
              Navigator.of(context).pop();
            }, 
            child: const Text('salvar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),)),

        ],
      ),
    );
  }









}
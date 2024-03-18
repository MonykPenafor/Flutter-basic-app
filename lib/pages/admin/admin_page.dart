import 'package:cardapio/pages/commodity/commodity_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      color: const Color.fromARGB(255, 20, 53, 4),
      child: Column(children: [
        Container(
          height: height * 0.13,
          width: width,
      
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
      
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Administração', 
                  style: TextStyle(
                    letterSpacing: 2, 
                    color: Color.fromARGB(255, 241, 135, 47), 
                    fontSize: 30, 
                    fontWeight:FontWeight.w700),
                ),
      
                Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/foto_perfil.jpg'))
                  ),
                )
        ],),),),
        
        Container(
          
          height: height * 0.68,
          width: width,
      
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25),),
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,
              children: [

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => CommodityPage(),));
                  },
                  child: Card(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(child: Image.asset('assets/images/foto_perfil.jpg', height: 150, width: 150, fit: BoxFit.fill,)),
                        const Text('commodity', style: TextStyle(color: Color.fromARGB(255, 20, 53, 4), fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),),
                ),


                Card(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(child: Image.asset('assets/images/foto_perfil.jpg', height: 150, width: 150, fit: BoxFit.fill,)),
                      const Text('cotação', style: TextStyle(color: Color.fromARGB(255, 20, 53, 4), fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),),


                Card(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(child: Image.asset('assets/images/foto_perfil.jpg', height: 150, width: 150, fit: BoxFit.fill,)),
                      const Text('região', style: TextStyle(color: Color.fromARGB(255, 20, 53, 4), fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),),


                Card(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(child: Image.asset('assets/images/foto_perfil.jpg', height: 150, width: 150, fit: BoxFit.fill,)),
                      const Text('grupos', style: TextStyle(color: Color.fromARGB(255, 20, 53, 4), fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),),


              ],),
          ),
      
      
      
      
      
      
        )
      
      
      
      
      ],),
    );
  }
}
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 142, 170, 135),
      child: Center(
        child: Column(children: [
          Container(
            height: 200,
          ),
          
        ],),
      ),
    );
  }
}
import 'package:flutter/material.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  // void goToThirdPage(BuildContext context){
  //   // Navigator.push(
  //   //   context, MaterialPageRoute(builder:(context)=> ThirdPage())
  //   // );
  //   Navigator.pushNamed(context, '/ThirdPage');
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
           title: const SizedBox(),
           flexibleSpace: Align(
           alignment: Alignment.bottomCenter,
           child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
          "Third Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ),
       backgroundColor: Colors.blue,),
    ); 
  }
}












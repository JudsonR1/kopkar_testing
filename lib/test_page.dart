import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  // void goToSecondPage(BuildContext context){
  //   // Navigator.push(
  //   //   context, MaterialPageRoute(builder:(context)=> SecondPage())
  //   // );
  //   Navigator.pushNamed(context, '/secondpage');
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
          "First Page",
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












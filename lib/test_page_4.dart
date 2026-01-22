import 'package:flutter/material.dart';


class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  // void goToSecondPage(BuildContext context){
  //   // Navigator.push(
  //   //   context, MaterialPageRoute(builder:(context)=> FourthPage())
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
          "Fourth Page",
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












import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';



class logo extends StatefulWidget{

  _logoState createState() => _logoState();
}


class _logoState extends State<logo>{

  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    },);
  }

  Widget build(BuildContext context){

    return Scaffold(

      body: Stack(

        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Image.asset('images/logo2.png',
                      height: 100.0, width: 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    "DigiNewspaper",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'ruby' ),
                  )
                ],
              ),
            ),
          ),
        ],),
    );

  }
}





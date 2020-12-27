import 'package:flutter/material.dart';
import 'package:nike/main.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "ABOUT US",
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              decorationStyle: TextDecorationStyle.wavy),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: new EdgeInsets.all(10.0),
        child: Text(
          "This app is Developed by:\n1.Partha Ghosh\n2.Leena sarkar\n3.Pawan kumar\n4.Dinesh Burnewal"
          "\nThis is a NIKE \nOnline Shoes Store\n"
          " This app is for Project Purpose ",
          style: TextStyle(fontFamily: 'DancingScript', fontSize: 30.0),
          textWidthBasis: TextWidthBasis.parent,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "CONTACT",
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              decorationStyle: TextDecorationStyle.wavy),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          child: Text("OUR CONTACT NO. : 7727987456\n "
              "                                    7320077311\n"
              "EMAIL US ON     : pk8327850@gmail.com\n  "
              "                          parthag714@gmail.com"),
        ),
      ),
    );
    ;
  }
}

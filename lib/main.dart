import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nike/cart.dart';
import 'package:nike/about.dart';
import 'package:nike/carousel.dart';

void main() {
  BuildContext context;
  runApp(
    MaterialApp(
        routes: {
          '/cart': (context) => Cart(),
          '/home': (context) => build(context),
          '/about': (context) => About(),
          '/contact': (context) => Contact()
        },
        debugShowCheckedModeBanner: false,
        title: "Nike",
        theme: ThemeData(
          primaryColor: Colors.cyanAccent,
          buttonColor: Colors.cyanAccent,
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        home: build(context)),
  );
}

Widget build(BuildContext context) {
  // TODO: implement build
  return new Builder(builder: (ctx) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "Nike",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
        body: Container(
          child: Column(
            children: <Widget>[
              //MyHomePage(),
              CarouselDemo()
            ],
          ),
        ));
  });
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: new BoxDecoration(
              color: Colors.purple,
            ),
            accountName: Text("partha"),
            accountEmail: Text("parthag714@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.purple
                  : Colors.white,
              child: Text(
                "P",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.purple),
              ),
            ),
          ),
          CustomListTileforDrawer(Icons.home, "Home",
              () => {Navigator.pushNamed(context, '/home')}),
          CustomListTileforDrawer(Icons.add_shopping_cart, "my shopping cart",
              () => {Navigator.pushNamed(context, '/cart')}),
          CustomListTileforDrawer(Icons.assignment_ind, "About Us",
              () => {Navigator.pushNamed(context, '/about')}),
          CustomListTileforDrawer(Icons.contact_phone, "Contact",
              () => {Navigator.pushNamed(context, '/contact')}),
        ],
      ),
    );
  }
}

class CustomListTileforDrawer extends StatelessWidget {
  IconData icon;
  String text;
  Function Ontap;

  CustomListTileforDrawer(this.icon, this.text, this.Ontap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        child: InkWell(
          onTap: Ontap,
          splashColor: Colors.purple,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final bannerItems = ["Banner1", "Banner2", "Banner3", "Banner4", "Banner5"];
  final bannerImages = [
    "images/banner1.jpg",
    "images/banner2.jpg",
    "images/banner3.jpg",
    "images/banner4.jpeg",
    "images/banner5.jpg"
  ];

  final productItems = [
    "product1",
    "product2",
    "product3",
    "product4",
    "product5"
  ];
  final productImages = [
    "images/spikes.png",
    "images/sports.jpg",
    "images/sneakers.jpg",
    "images/formal.jpg",
    "images/casual.jpg"
  ];

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            myHList(),
            productList(),
          ],
        ),
      ),
    );
  }

  myHList() {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'F'];
    final List<int> colorCodes = <int>[600, 500, 100, 400, 400];

    //Image.asset("images/banner1.jpg");
    return SizedBox(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: bannerImages.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                color: Colors.white,
                child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image(
                            image: AssetImage('${bannerImages[index]}')))),
              );
            }));
  }

  productList() {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'F'];
    final List<int> colorCodes = <int>[600, 500, 100, 400, 400];

    return SizedBox(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: productImages.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 250,
                width: 800,
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                color: Colors.white,
                child: Center(
                    child: Image(image: AssetImage('${productImages[index]}'))),
              );
            }));
  }
}

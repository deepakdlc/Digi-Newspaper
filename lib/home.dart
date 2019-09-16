import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'webview.dart';
import 'news.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  final widgetOptions = [
    WebBr(),
    Buttons(),
    Text("Tv")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), title: Text('News')),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv), title: Text('TV')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
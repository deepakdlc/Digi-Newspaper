import 'package:flutter/material.dart';
import 'logo.dart';

void main() => runApp(WebBrowser());



class WebBrowser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logo(),
    );
  }
}

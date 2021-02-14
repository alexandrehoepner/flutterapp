
import 'package:flutter/material.dart';
import 'package:tibia_client/home_page.dart';

void main() {
  runApp(TibiaClientApp());
}

class TibiaClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomePage(),
    );
  }
}

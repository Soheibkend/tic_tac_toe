import 'package:flutter/material.dart';
import 'package:tic_tac_tao/HomeScreen.dart';


void main () {
  runApp(TicTacTaoApp());
}

class TicTacTaoApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black38,
          ),
      home: HomeScreen(),
    );
  }
}
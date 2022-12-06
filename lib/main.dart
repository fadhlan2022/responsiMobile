// Nama : Fadhlan Hisyam
// NIM  : 124200022
// Plug : A

import 'package:flutter/material.dart';
import 'package:responsi_124200022/match/list_match.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fadhlan Hisyam (124200022)",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Menu(),
      ),
    );
  }
}

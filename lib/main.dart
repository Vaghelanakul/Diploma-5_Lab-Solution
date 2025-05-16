import 'package:flutter/material.dart';

import 'Lab4/Practical2.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HorizontalParts(),
    );
  }
}

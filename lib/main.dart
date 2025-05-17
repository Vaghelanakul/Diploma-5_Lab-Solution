import 'package:flutter/material.dart';

import 'Lab4/Practical2.dart';
import 'Lab4/Practical3.dart';
import 'Lab4/Practical4.dart';
import 'Lab4/Practical5.dart';
import 'Lab5/Practical1.dart';
import 'Lab5/Practical2.dart';
import 'Lab5/Practical3.dart';
import 'Lab6/Practical1.dart';
import 'Lab6/Practical2.dart';
import 'Lab7/Practical1.dart';
import 'Lab7/Practical2.dart';
import 'Lab7/Practical3.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BirthDayCard(),
    );
  }
}

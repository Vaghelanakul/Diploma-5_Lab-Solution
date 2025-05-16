// 1. W.A.P. to display “hello world” using Text widget. Change color & size of
// text using different properties. (A)

import 'package:flutter/material.dart';

class TextWidgetDemo extends StatelessWidget {
  const TextWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget Demo"),
        backgroundColor: Colors.grey,
      ),
      body: const Center(
        child: Text(
          "hello world",
          style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic

          ),
        ),
      ),
    );
  }
}

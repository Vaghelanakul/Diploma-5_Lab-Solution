// 2. W.A.P. to divide horizontal space of the screen into 3 different equal parts
// with different colors. (A)

import 'package:flutter/material.dart';

class HorizontalParts extends StatelessWidget {
  const HorizontalParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Horizontal parts"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // height: 100,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.greenAccent,
            ),
          ),
          Expanded(
            child: Container(color: Colors.yellow),
          )
        ],
      ),
    );
  }
}

// 3. W.A.P. to divide the vertical space of the screen into 3 different equal parts
// with different colors. (A)

import 'package:flutter/material.dart';

class VerticalParts extends StatelessWidget {
  const VerticalParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Vertical parts"),
      ),
      body: Row(
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

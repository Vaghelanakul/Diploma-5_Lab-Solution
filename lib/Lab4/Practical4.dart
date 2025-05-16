// 4. W.A.P. to divide the whole screen into 9 (equal size and different size) with
// different colors. (B)

import "package:flutter/material.dart";

class EqualPartsOfScreen extends StatelessWidget {
  const EqualPartsOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("9 equals parts"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.greenAccent,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.red,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.orangeAccent,
                      ))
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.blueAccent,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.black,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.white,
                      ))
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.greenAccent,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.red,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.orangeAccent,
                      ))
                ],
              )),
        ],
      ),
    );
  }
}

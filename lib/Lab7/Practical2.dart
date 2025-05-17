// 2. W.A.P. to use Stack widget and show text upon an Image. (A)
import 'package:flutter/material.dart';
class StackWidgetDemo extends StatelessWidget {
  const StackWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack widget demo"),
      ),
      body: Stack(
        children: [
          Image.asset("./assets/images/batman.jpg"),
          Positioned(
            bottom: 10,
              right: 10,
              child: Text("the-dark-night",style: TextStyle(color: Colors.white),)),
        ],
      ),
    );
  }
}

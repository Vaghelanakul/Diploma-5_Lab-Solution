// 1. W.A.P. to display an Image into the Image asset widget from the asset
// folder. (A)

import 'package:flutter/material.dart';
class AssetImageWidgetDemo extends StatelessWidget {
  const AssetImageWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asset image demo"),
      ),
      body: Center(
        child: Image.asset("./assets/images/batman.jpg",fit: BoxFit.cover,),
      ),
    );
  }
}

// 4. W.A.P. to display an Image from a WEB URL using a cached network
// Image. (B)

import 'package:flutter/material.dart';
class NetworkImageDemo extends StatelessWidget {
  const NetworkImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network image demo"),
      ),
      body: Center(
        child: Container(
            height: 500,
            width: 500,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy92QP882ZWAElXB_xhxoNCap5o-jNILNtBw&s",
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}


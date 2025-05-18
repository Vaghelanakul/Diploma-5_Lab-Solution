// 3. W.A.P. to create a birthday card using different widgets.(A)

import 'package:flutter/material.dart';

class BirthDayCard extends StatelessWidget {
  const BirthDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Stack Example",
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk0tJcolA0uzaEqx3L89l0itlCCAgoi-24uA&s",
                  fit: BoxFit.cover)),
          const Padding(
            padding: EdgeInsets.only(top:30,left:0),
            child: Center(child: Text("abc",style: TextStyle(fontSize: 70,color: Colors.blueAccent,),)),
          ),
        ],
      ),
    );
  }
}

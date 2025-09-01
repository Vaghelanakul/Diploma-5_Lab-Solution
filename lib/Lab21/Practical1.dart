import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MaterialAlertExample extends StatelessWidget {
  const MaterialAlertExample({super.key});

    void showMaterialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text("Material Alert"),
        content:  Text("This is a Material (Android) Alert Dialog."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context,false),
            child: Text("Cancle",),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context,true),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void showCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title:  Text("Material Alert"),
        content:  Text("This is a Material (Android) Alert Dialog."),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context,false),
            child: Text("Cancle",),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context,true),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Material Alert Dialog")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showMaterialDialog(context),
              child:  Text("Show Material  Alert",
                style: TextStyle(color: Colors.black,fontSize: 25),),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => showCupertinoAlert(context),
              child:  Text("Show Cupertino Alert",
                style: TextStyle(color: Colors.black,fontSize: 25),),
            ),
          ],
        ),
      ),
    );
  }
}

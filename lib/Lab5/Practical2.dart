// 2. W.A.P. to use TextField and print the input value into the terminal using the
// controller. (A)

import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
class TextFieldDemo extends StatelessWidget {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Widget demo"),
        backgroundColor: Colors.grey,
      ),
      body:Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter text",
                hintStyle: TextStyle(color: Colors.blueAccent,fontSize: 15),
                labelText: "enter text",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20))


                ),
                onPressed: (){
                  print("Entered text is:${controller.text}");
                }, child: Text("Print Text",))
          ],
        ),
      ),

    );
  }
}

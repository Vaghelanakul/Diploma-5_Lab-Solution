import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_crud/Lab17/myDatabase.dart';
import 'package:student_crud/Lab17/studentModel.dart';
import 'package:student_crud/Lab18/insertScreen.dart';

import '../Lab19/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final pswController = TextEditingController();
  bool obscureText = true;

  //region more efficient login method
  // for incorrect username msg and psw we use this code

  // String? usernameError;
  // String? passwordError;
  // @override
  // void initState() {
  //   super.initState();
  //   usernameError = null;
  //   passwordError = null;
  //   nameController.clear();
  //   pswController.clear();
  // }
  // void isLogin() async {
  //   setState(() {
  //     usernameError = null;
  //     passwordError = null;
  //   });
  //
  //   if (formKey.currentState!.validate()) {
  //     Student? student = await DatabaseHelper.instance.getStudentByName(
  //       nameController.text,
  //     );
  //
  //     if (student == null) {
  //       setState(() {
  //         usernameError = "User does not exist";
  //       });
  //     } else if (student.password != pswController.text) {
  //       setState(() {
  //         passwordError = "Wrong password";
  //       });
  //     } else {
  //       setState(() {
  //         usernameError = "";
  //         passwordError = "";
  //       });
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (_) => DisplayStudent()),
  //       );
  //       formKey.currentState!.reset();
  //       nameController.clear();
  //       pswController.clear();
  //     }
  //   }
  // }
  //endregion we

  void login() async {
    if (formKey.currentState!.validate()) {
      String enteredName = nameController.text.trim();
      String enteredPsw = pswController.text.trim();

      Student? student =
      await DatabaseHelper.instance.getStudentByName(enteredName);

      if (student != null &&
          student.studentName == enteredName
          && student.password == enteredPsw) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DisplayStudent()),
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("successfully Login")));

        formKey.currentState!.reset();
        nameController.clear();
        pswController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Incorrect username or password")),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.only(top: 100, left: 10, right: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (val) =>
                    val == null || val.isEmpty ? "please enter name" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: pswController,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "please enter password" : null,
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => login(), child: Text("Login")),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?",style: TextStyle(fontSize: 20)),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddStudentScreen()),
                    ),
                    child: Text("SignUp Here",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

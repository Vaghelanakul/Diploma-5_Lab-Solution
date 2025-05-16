// 1. W.A.P. to Add password visibility icon in the Text field. (A)

import "package:flutter/material.dart";

class LoginScreenWithPasswordVisibility extends StatefulWidget {
  const LoginScreenWithPasswordVisibility({super.key});

  @override
  State<LoginScreenWithPasswordVisibility> createState() => _LoginScreenWithPasswordVisibilityState();
}

class _LoginScreenWithPasswordVisibilityState extends State<LoginScreenWithPasswordVisibility> {
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obscureText=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    labelText: "email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "please enter email";
                    }
                    final emailPattern=RegExp(r'^[\w.-]+@[\w]+\.+[\w]{2,4}$');
                    if(!emailPattern.hasMatch(value)){
                      return "please enter valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: "enter password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        obscureText=!obscureText;
                      });
                    }, icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility
                    )),
                    labelText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "please enter password";
                    }
                    final passwordPattern=RegExp(r'^[\w.]+$');
                    if(!passwordPattern.hasMatch(value)){
                      return "please enter valid password";
                    }
                    if(value.length<7){
                      return "password must be at lease 8 letter";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Successfully login"))
                    );
                  }
                }, child: Text("Login"))
              ],
            )
        ),
      ),
    );
  }
}

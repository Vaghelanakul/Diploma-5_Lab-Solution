// 2. W.A.P. to create a registration screen using different widgets (Text,
// TextFromField, SizedBox, Radio, CheckBox, List, Button etc…)(B)


import 'package:flutter/material.dart';

enum Gender {male,female}

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key});


  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {

  final formKey=GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  Gender selectedGender=Gender.male;
  List<String> hobbies = ["Reading","Writing","Painting"];
  List<String> selectedHobbies=[];
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Survey Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 50),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return "plesae enter name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "enter your name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: email,
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
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "enter your email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Select Gender :",style: TextStyle(fontSize: 20),)),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        const Text("Male",style: TextStyle(fontSize: 20),),
                        RadioListTile<Gender>(value: Gender.male, groupValue: selectedGender , onChanged: (value){
                          setState(() {
                            selectedGender=value!;
                          });
                        }),
                        const Text("Female",style: TextStyle(fontSize: 20),),
                        RadioListTile<Gender>(value: Gender.female, groupValue: selectedGender, onChanged: (value){
                          setState(() {
                            selectedGender=value!;
                          });
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select city:",style: TextStyle(fontSize: 20),),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select your Hobbies:",style: TextStyle(fontSize: 20),),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: hobbies.map( (hobby){
                      return CheckboxListTile(

                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(hobby),
                          value: selectedHobbies.contains(hobby),
                          onChanged: (bool? selected){
                            setState(() {
                              if(selected!){
                                selectedHobbies.add(hobby);
                              }else{
                                selectedHobbies.remove(hobby);
                              }
                            });
                          }
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Survey form filled successfully"))
                      );

                    }
                  }, child: const Text("Submit"))



                ],
              )
          ),
        ),
      ),
    );
  }
}
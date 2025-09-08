import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();



  final String apiUrl =
           'https://67d1b97690e0670699bb4eae.mockapi.io/user_detail';

  Future<void> submitData() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {
          'name': nameController.text,
          'dob': dobController.text,
          'city': cityController.text,
          'address': addressController.text,
        }),
      );

      if (response.statusCode == 201 ||
          response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text("Data submitted successfully!")),
        );

        nameController.clear();
        dobController.clear();
        cityController.clear();
        addressController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text("Failed to submit data.")),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entry Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                  controller: nameController,
                  label: "Name"),
              buildTextField(
                controller: dobController,
                label: "DOB",
                readOnly: true,
                onTap: _pickDate,
              ),
              buildTextField(
                  controller: cityController,
                  label: "City"),
              buildTextField(
                  controller: addressController,
                  label: "Address"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitData,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      String formattedDate =
          "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      setState(() {
        dobController.text = formattedDate;
      });
    }
  }



  Widget buildTextField(
      {required TextEditingController controller,
        required String label,
        bool readOnly = false,
        VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green)
            )
        ),
        onTap: onTap,
        validator: (value) =>
        value == null || value.isEmpty ? 'Enter $label' : null,
      ),
    );
  }
}

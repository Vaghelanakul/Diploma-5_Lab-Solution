import 'package:flutter/material.dart';
import 'package:student_crud/Lab18/loginScreen.dart';
import '../Lab17/myDatabase.dart';
import '../Lab17/studentModel.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _enrollmentController = TextEditingController();
  final _semesterController = TextEditingController();
  final _branchController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;

  // void _submitForm() async{
  //   if (_formKey.currentState!.validate()) {
  //
  //     Student student= Student(
  //       studentName: _nameController.text,
  //       studentEnrollmentNo:  _enrollmentController.text,
  //       semester: _semesterController.text,
  //       branch: _branchController.text,
  //       mobile: _mobileController.text,
  //       password: _passwordController.text,
  //     );
  //     await DatabaseHelper.instance.insertStudent(student);
  //     Navigator.pop(context,true);
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Student  added successfully!')),
  //     );
  //     _formKey.currentState!.reset();
  //     _nameController.clear();
  //     _enrollmentController.clear();
  //     _semesterController.clear();
  //     _branchController.clear();
  //     _mobileController.clear();
  //     _passwordController.clear();
  //     _confirmPasswordController.clear();
  //   }
  // }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      Student student = Student(
          studentName: _nameController.text,
          studentEnrollmentNo: _enrollmentController.text,
          semester: _semesterController.text,
          branch: _branchController.text,
          mobile: _mobileController.text,
          password: _passwordController.text
      );

      await DatabaseHelper.instance.insertStudent(student);

      ScaffoldMessenger.of(context).
      showSnackBar(
        SnackBar(content: Text("Student added successfully"),),
      );

      _formKey.currentState!.reset();
      _nameController.clear();
      _enrollmentController.clear();
      _semesterController.clear();
      _branchController.clear();
      _mobileController.clear();
      _passwordController.clear();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter name' : null,
              ),
              const SizedBox(height: 12),

              // Enrollment Number
              TextFormField(
                controller: _enrollmentController,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                    labelText: 'Enrollment Number'),
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Enter enrollment number'
                    : null,
              ),
              const SizedBox(height: 12),

              // Semester
              TextFormField(
                controller: _semesterController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Semester'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter semester';
                  }
                  int? semester = int.tryParse(value);
                  if (semester == null || semester < 1 || semester > 8) {
                    return 'Enter valid semester (1-8)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Branch
              TextFormField(
                controller: _branchController,
                decoration: const InputDecoration(labelText: 'Branch'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter branch' : null,
              ),
              const SizedBox(height: 12),

              // Mobile Number
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter mobile number';
                  }
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Enter valid 10-digit number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons
                            .visibility),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter password';
                  if (value.length < 6)
                    return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Confirm your password';
                  if (value != _passwordController.text)
                    return 'Passwords do not match';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:submitForm,
                child: const Text('Add Student'),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}

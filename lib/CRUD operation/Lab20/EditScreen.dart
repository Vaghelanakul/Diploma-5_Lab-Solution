import 'package:flutter/material.dart';
import 'package:student_crud/Lab17/myDatabase.dart';
import 'package:student_crud/Lab17/studentModel.dart';

class EditScreen extends StatefulWidget {
  final Student student;
  final VoidCallback onUpdate;
  const EditScreen({super.key, required this.student, required this.onUpdate,  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final formKey=GlobalKey<FormState>();
  late  TextEditingController nameController;
  late TextEditingController  enrollmentController;
  late  TextEditingController  semController ;
  late  TextEditingController  branchController;
  late  TextEditingController mobileController ;

  @override
  void initState(){
    super.initState();
    nameController=TextEditingController(
        text: widget.student.studentName) ;
    enrollmentController=TextEditingController(
        text: widget.student.studentEnrollmentNo);
    semController=TextEditingController(
        text: widget.student.semester) ;
    branchController=TextEditingController(
        text: widget.student.branch) ;
    mobileController=TextEditingController(
        text: widget.student.mobile) ;
  }


  void updateStudent() async{
    if(formKey.currentState!.validate()){
      final updatedStudent=Student(
        studentId: widget.student.studentId,
        studentName: nameController.text,
        studentEnrollmentNo: enrollmentController.text,
        semester: semController.text,
        branch: branchController.text,
        mobile: mobileController.text,
      );
      await DatabaseHelper.instance.updateStudentDetail(updatedStudent);
      widget.onUpdate();
      Navigator.pop(context,true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Student"),),
      body: Form(
          key: formKey,
          child:Column(
            children: [
              TextFormField(controller: nameController,
                decoration: InputDecoration(labelText: "Name"),),
              TextFormField(controller: enrollmentController,
                decoration: InputDecoration(labelText: "Enrollment No"),),
              TextFormField(controller: semController,
                decoration: InputDecoration(labelText: "Semester"),),
              TextFormField(controller: branchController,
                decoration: InputDecoration(labelText: "Branch"),),
              TextFormField(controller: mobileController,
                decoration: InputDecoration(labelText: "Mobile"),),
              ElevatedButton(onPressed: updateStudent, child: Text("Update Student"))
            ],
          )
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(title: const Text("Edit Student")),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16),
    //     child: Form(
    //       key: formKey,
    //       child: ListView(
    //         children: [
    //           TextFormField(controller: nameController,
    //               decoration: const InputDecoration(labelText: 'Name')),
    //           TextFormField(controller: enrollmentController,keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Enrollment No')),
    //           TextFormField(controller: semController, keyboardType: TextInputType.number,decoration: const InputDecoration(labelText: 'Semester')),
    //           TextFormField(controller: branchController, decoration: const InputDecoration(labelText: 'Branch')),
    //           TextFormField(controller: mobileController, keyboardType: TextInputType.number,decoration: const InputDecoration(labelText: 'Mobile')),
    //           const SizedBox(height: 20),
    //           ElevatedButton(onPressed: updateStudent, child: const Text("Update Student"))
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

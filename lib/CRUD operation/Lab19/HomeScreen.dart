import 'package:flutter/material.dart';
import 'package:student_crud/Lab17/studentModel.dart';
import '../Lab17/myDatabase.dart';
import 'package:student_crud/Lab18/insertScreen.dart';
import 'package:student_crud/Lab19/studentDetailScreen.dart';
import '../Lab20/EditScreen.dart';

class DisplayStudent extends StatefulWidget {
  const DisplayStudent({super.key});

  @override
  State<DisplayStudent> createState() => _DisplayStudentState();
}

class _DisplayStudentState extends State<DisplayStudent> {
  List<Student> students = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    List<Student> result = await
    DatabaseHelper.instance.getStudentDetails();
    setState(() {
      students = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home screen")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : students.isEmpty
          ? Center(child: Text("No student data found."))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              StudentDetailScreen(student: students[index],),
                        ),
                      );
                    },
                    title: Text("name: ${students[index].studentName}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enrollment No: ${students[index].studentEnrollmentNo}",
                        ),
                        SizedBox(width: 10),
                        Text("branch: ${students[index].branch}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => EditScreen(
                                student: students[index],
                                onUpdate:fetchStudents,)),
                            ).then( (_){
                              fetchStudents();
                            });
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                            onPressed: () async {
                              final shouldDelete = await showDialog<bool>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text("Delete Student"),
                                  content: Text("Are you sure you want to delete this student?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, false),
                                      child: Text("No"),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, true),
                                      child: Text("Yes"),
                                    ),
                                  ],
                                ),
                              );
                              if (shouldDelete == true) {
                                await DatabaseHelper.instance.deleteStudent(student.studentId!);
                                fetchStudents(); // Refresh the list
                              }
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed:()async{
          final result = await Navigator.push(context, MaterialPageRoute(builder: (_)=>AddStudentScreen()));
          if(result == true){
             fetchStudents();
          }

          },
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:student_crud/Lab17/studentModel.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;
  const StudentDetailScreen({super.key, required this.student,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.studentName!),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.person, size: 60, color: Colors.blue.shade700),
            ),
            SizedBox(height: 10,),
            Text(student.studentName.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20),
            _buildDetailCard(Icons.badge, "Enrollment No", student.studentEnrollmentNo),
            _buildDetailCard(Icons.event, "Semester", student.semester),
            _buildDetailCard(Icons.account_tree, "Branch", student.branch),
            _buildDetailCard(Icons.phone, "Mobile", student.mobile),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String label, String? value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 28),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value ?? "N/A"),
      ),
    );
  }
}

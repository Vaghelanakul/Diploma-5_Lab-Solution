import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetailScreen extends StatelessWidget {
  final String id;
  final String baseUrl = "https://67d1b97690e0670699bb4eae.mockapi.io/user_detail";

  UserDetailScreen({required this.id});

  Future<Map<String, dynamic>> fetchUserDetail() async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Detail Screen")),
      body: FutureBuilder(
        future: fetchUserDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No user found"));
          } else {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID: ${user['id']}"),
                  SizedBox(height: 10),
                  Text("Name: ${user['name']}",),
                  SizedBox(height: 10),
                  Text("Email: ${user['email']}",),
                  SizedBox(height: 10),
                  Text("Dob: ${DateTime.parse(user['dob']).toLocal().toString().split(' ')[0]}",),
                  SizedBox(height: 10),
                  Text("Address: ${user['address']}",),
                  SizedBox(height: 10),
                  Text("City: ${user['city']}",),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
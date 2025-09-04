import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Practical2.dart';

class UserListScreen extends StatelessWidget {
  final String apiUrl =
      "https://67d1b97690e0670699bb4eae.mockapi.io/user_detail";

  // Future<List<Map<String,dynamic>>> fetchUsers() async {
  //   final response = await http.get(Uri.parse(apiUrl));
  //   final List data = json.decode(response.body) as List;  // cast to List
  //   return data.map((e) => e as Map<String, dynamic>).toList();
  // }
  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users List")),
      body: FutureBuilder(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found"));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UserDetailScreen(
                                  id: user["id"],
                                ))),
                    title: Text("name : ${user['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("email : ${user['email']}"),
                        Text("city : ${user['city']}"),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({super.key});

  final List<Map<String, String>> contacts = [
    {'name': 'Dhoni', 'initial': 'D'},
    {'name': 'Virat', 'initial': 'V'},
    {'name': 'Rohit', 'initial': 'R'},
    {'name': 'Jadeja', 'initial': 'J'},
    {'name': 'Bumrah', 'initial': 'B'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          var contact = contacts[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(contact["initial"]!),

              ),
              title: Text(contact['name']!),
              trailing: Icon(Icons.call),
            ),
          );
        },
      ),
    );
  }
}
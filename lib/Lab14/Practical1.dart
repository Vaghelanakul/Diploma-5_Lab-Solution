import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View demo"),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          buildPage(title: "page1", color: Colors.green),
          buildPage(title: "page2", color: Colors.blue),
          buildPage(title: "page3", color: Colors.yellow),
        ],
      ),
    );
  }

  Widget buildPage({required String title, required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 10,
        color: color,
        child: Center(
          child: Text(title,style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}

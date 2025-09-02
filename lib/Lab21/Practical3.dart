import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'Practical2.dart'

class JsonFromAssetExample extends StatefulWidget {
  const JsonFromAssetExample({super.key});

  @override
  State<JsonFromAssetExample> createState() => _JsonFromAssetExampleState();
}

class _JsonFromAssetExampleState extends State<JsonFromAssetExample> {
  Future<List<Product>> loadJsonData() async {
    // Load json string from assets
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = jsonDecode(response);
    // Convert List<dynamic> to List<Product>
    return data.map( (item) => Product.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products from JSON")),
      body: FutureBuilder<List<Product>>(
        future: loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found"));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(product.id.toString())),
                  title: Text(product.title),
                  subtitle: Text("Price: ${product.price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}

//product.json in assets folder
// [
// {
// "id": 1,
// "title": "Laptop",
// "price": 55000
// },
// {
// "id": 2,
// "title": "Smartphone",
// "price": 20000
// },
// {
// "id": 3,
// "title": "Headphones",
// "price": 2500
// }
// ]
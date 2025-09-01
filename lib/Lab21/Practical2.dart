import 'dart:convert';

class Product {
  final int id;
  final String title;
  final double price;
  final String category;

  //CONSTRUCTOR
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
  });
  //object

  //convert  obj to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "category": category,
    };
  }
  // List<Map> -> obj

  //convert json to obj
  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      category: json["category"],
    );
  }
}

void main() {
  String jsonString =
      '{"id":1,"title":"Product 1","price":29.99,"category":"electronics"}';

  // Convert JSON String -> Map
  Map<String, dynamic> productMap =  jsonDecode(jsonString);
  // Convert Map -> Product Model
  Product product = Product.fromJson(productMap);
  print("Product Title: ${product.title}");
  print("Product Price: ${product.price}");
  // Convert Product -> JSON
  String newJson = jsonEncode(product.toJson());
  print("Converted back to JSON: $newJson");
}


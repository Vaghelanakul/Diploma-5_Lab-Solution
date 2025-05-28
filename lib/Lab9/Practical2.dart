import "package:flutter/material.dart";
class QuoteApp extends StatefulWidget {
  const QuoteApp({super.key});

  @override
  State<QuoteApp> createState() => _QuoteAppState();
}

class _QuoteAppState extends State<QuoteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote App"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            quoteCard(quote: "Believe you can and you're halfway there", author: "Theodore Roosevelt"),
            quoteCard(quote: "Success is not final, failure is not fatal: It is the courage to continue that counts.", author: " Winston Churchill"),
            quoteCard(quote: "Push yourself, because no one else is going to do it for you.", ),
            quoteCard(quote: "Don't watch the clock; do what it does. Keep going.", author: "Sam Levenson"),
            quoteCard(quote: "Great things never come from comfort zones.", ),
            quoteCard(quote: "It always seems impossible until it’s done.", author: "Nelson Mandela"),
          ],
        ),
      ),
    );
  }
  Widget quoteCard({required String quote,String? author}){
    return Card(
      child: ListTile(
        title: Text(quote,style: TextStyle(fontWeight: FontWeight.bold,),),
        subtitle: Text("author:${author ?? "Unknown"}"),
        trailing: IconButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copy to clipboard")));
        }, icon: Icon(Icons.copy)),

      ),

    );
  }
}

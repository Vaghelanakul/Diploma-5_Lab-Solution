

import 'package:flutter/material.dart';

class ShoppingItemCards extends StatefulWidget {
  const ShoppingItemCards({super.key});

  @override
  State<ShoppingItemCards> createState() => _ShoppingItemCardsState();
}

class _ShoppingItemCardsState extends State<ShoppingItemCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Shopping Item Card', style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildCard(
                  url: 'https://tse2.mm.bing.net/th/id/OIP.ks_9WSJKG8xaR0ww_ud4YAHaHa?cb=iwp2&rs=1&pid=ImgDetMain',
                  title: 'Samsung Galaxy S25',
                  subtitle: 'Latest flagship smartphone',
                  count: 2
              ),
              buildCard(
                  url: 'https://th.bing.com/th/id/OIP.ufKAkmDKCvGgc5SUx1OhWgHaHa?w=184&h=184&c=7&r=0&o=7&cb=iwp2&dpr=1.8&pid=1.7&rm=3',
                  title: 'Bag',
                  subtitle: 'Latest Bag',
                  count: 1
              )
            ],
          ),
        ),
      ),
    );
  }


  Card buildCard({required String url, required String title, String? subtitle , int count = 0}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 180,
                width: 180,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(subtitle ?? "",),
                    SizedBox(height: 95,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(), // Using CircleBorder for circular buttons
                                backgroundColor: Colors.grey.shade300,
                                minimumSize: const Size(40, 40), // Setting minimum size for the button
                              ),
                              onPressed: () {},
                              child: const Text('-'), // Changed to '-' for a decrement button
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20), // Adding some spacing
                              child: Text('$count', style: TextStyle(fontSize: 18)),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.shade300,
                                minimumSize: const Size(40, 40),
                              ),
                              onPressed: () {},
                              child: const Text('+'),
                            ),
                          ],
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}



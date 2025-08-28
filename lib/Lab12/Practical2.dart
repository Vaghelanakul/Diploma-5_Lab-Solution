import 'package:flutter/material.dart';

class EcommercePage extends StatelessWidget {
  EcommercePage({super.key});

  final List<Map<String, String>> products = [
  {
  'name': 'Shoes',
  'image':
  'https://tse4.mm.bing.net/th?id=OIP.WIyRv7oe0yuLCuQdx_t8TQHaEl&pid=Api&P=0&  h=180',
  'subtitle': 'Comfortable running shoes'
},
{
'name': 'Watch',
'image':
'https://tse4.mm.bing.net/th?id=OIP.qQjbwHJRYwnrx_vEhQZnwHaFj&pid=Api&P=0&h=180',
'subtitle': 'Luxury wrist watch'
},
{
'name': 'Bag',
'image':'https://tse1.mm.bing.net/th?id=OIP.qLQo_DIMqXI9yNI7_q2pgHaHa&pid=Api&P=0&h=180',
      'subtitle': 'Stylish backpack'
},
{
'name': 'T-Shirt',
'image':

'https://tse3.mm.bing.net/th?id=OIP.cv4atVHarHMgwnqAtpu9vQHaLH&pid=Api&P=0&h=180',
'subtitle': 'Cotton T-shirt'
},
    {
      'name': 'Headphones',
      'image':

      'https://tse4.mm.bing.net/th?id=OIP.v6S3uyg9Z4UAN3s9Rh7qVwHaLH&pid=Api&P=0&h=180',
    'subtitle': 'Noise-cancelling headphones'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('E-Commerce UI')),
        body: Column(
            children: [
        Expanded(
        child: ListView.builder(
        itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(product['image']!),
                  ),
                  title: Text(product['name']!),
                  subtitle: Text(product['subtitle'] ?? ''),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Details'),
                  ),
                ),
              );
            },
        ),
        ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Add to Cart'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Wishlist'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
    );
  }
}
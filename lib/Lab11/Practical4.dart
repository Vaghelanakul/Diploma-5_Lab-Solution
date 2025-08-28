import 'package:flutter/material.dart';
class GridviewBuilderDemo extends StatefulWidget {
  const GridviewBuilderDemo({super.key});

  @override
  State<GridviewBuilderDemo> createState() => _GridviewBuilderDemoState();
}

class _GridviewBuilderDemoState extends State<GridviewBuilderDemo> {

  List<String> images = [

    'https://tse2.mm.bing.net/th/id/OIP.ks_9WSJKG8xaR0ww_ud4YAHaHa?cb=iwp2&rs=1&pid=ImgDetMain',
    'https://encryptedtbn0.gstatic.com/images?q=tbn:ANd9GcTy92QP882ZWAElXB_xhxoNCap5ojNILNtBw&s',
    'https://tse1.mm.bing.net/th/id/OIP.sjkhI5eKl3m7AIsEnFf77AHaHa?cb=iwp2&rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/R.d5fb0ef361f7bfca6069e1978ff73438?rik=nn9y6PCwvDZ0Hg&riu=http%3a%2f%2fpixelwibes.com%%2ffront%2fimages%2fservice%2fflutterlogo.png&ehk=W8I4AdZ3kl%2by5VA47lTlDr%2blO%2fkCEtsX5pYCnrrNt7I%3d&risl=&pid=ImgRaw&r=0',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Gridview', style: TextStyle(color: Colors.white),),
      ),
      body: GridView.builder(
          itemCount: images.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            // String image = images[index];
            return Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(borderRadius:
              BorderRadius.circular(10)),
              child: Image.network(images[index], fit: BoxFit.cover,),
            );
          }
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab Bar Demo"),
            // backgroundColor: Colors.gree,

            bottom: TabBar(
              labelColor: Colors.green ,
                unselectedLabelColor: Colors.black,
                // dividerColor: Colors.blue,
                dividerHeight: 0,

                tabs: [
                  Tab(
                    text:"Chat",
                    icon: Icon(Icons.chat),
                  ),
                  Tab(
                    text:"Status",
                    icon: Icon(Icons.photo_album_outlined),
                  ),
                  Tab(
                    text:"Call",
                    icon: Icon(Icons.call),
                  )
                ]
            ),
          ),
          body: TabBarView(
              children:[
                Center(child: Text("Chat Page"),),
                Center(child: Text("Status Page"),),
                Center(child: Text("Call Page"),)
              ]
          ),
        )
    );
  }
}

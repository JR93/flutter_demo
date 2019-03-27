import 'package:flutter/material.dart';

class TabPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          title: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Icon(Icons.directions_car)),
            Center(child: Icon(Icons.directions_transit)),
            Center(child: Icon(Icons.directions_bike)),
          ],
        ),
      ),
    );
  }
}
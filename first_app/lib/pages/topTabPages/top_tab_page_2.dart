import 'package:flutter/material.dart';

class TabPage2 extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          title: TabBar(
            tabs: myTabs,
            indicatorColor: Colors.white,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) => Center(child: Text(tab.text),)).toList(),
        ),
      ),
    );
  }
}
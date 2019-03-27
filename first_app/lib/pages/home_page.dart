import 'package:flutter/material.dart';

import './other_page.dart';
import './topTabPages/top_tab_page_1.dart';
import './topTabPages/top_tab_page_2.dart';
import './topTabPages/top_tab_page_3.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final List<Tab> _bottomTabs = <Tab>[
    Tab(text: 'Home', icon: Icon(Icons.home),),
    Tab(text: 'History', icon: Icon(Icons.history),),
    Tab(text: 'Book', icon: Icon(Icons.book),),
  ];

  TabController _bottomNavigation;

  @override
  void initState() {
    super.initState();
    _bottomNavigation = new TabController(
      vsync: this,
      length: _bottomTabs.length,
    );
  }

  @override
  void dispose() {
    _bottomNavigation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JR'),
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          // padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('JR'),
              accountEmail: Text('gjr_china@163.com'),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  print('Hello JR!');
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/12216163?s=40&v=4'),
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    print('Hello JR\'s fans!');
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/12216163?s=40&v=4'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Hello JR\'s fans!');
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/12216163?s=40&v=4'),
                  ),
                ),
              ],
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: ExactAssetImage('images/11.jpg')
                )
              ),
            ),
            ListTile(
              title: Text('First Page'),
              trailing: Icon(Icons.arrow_upward),
              // leading: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => OtherPage('First Page')
                  )
                );
              },
            ),
            ListTile(
              title: Text('Second Page'),
              trailing: Icon(Icons.arrow_right),
              // leading: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => OtherPage('Second Page')
                  )
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.cancel),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _bottomNavigation,
        children: <Widget>[
          News(),
          TabPage2(),
          TabPage3(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.redAccent,
        child: TabBar(
          controller: _bottomNavigation,
          tabs: _bottomTabs,
          indicatorColor: Colors.white,
        ),
      )
    );
  }
}
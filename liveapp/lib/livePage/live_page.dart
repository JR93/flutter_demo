import 'package:flutter/material.dart';
import './live_list.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => new _LivePageState();
}

class _LivePageState extends State<LivePage> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red
      ),
      child: PageView(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          LiveList(),
          Center(
            child: Text('999', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
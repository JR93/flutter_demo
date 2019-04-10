import 'package:flutter/material.dart';
import './live_list.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => new _LivePageState();
}

class _LivePageState extends State<LivePage> {
  PageController _controller;

  // @override
  // bool get wantKeepAlive => true;

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
      child: PageView(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          LiveList(),
          Center(
            child: Text('直播推荐列表-待续', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
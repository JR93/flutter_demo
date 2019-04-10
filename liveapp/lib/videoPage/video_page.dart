import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => new _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
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
        // color: Colors.red
      ),
      child: PageView(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Center(
            child: Text('video-666', style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Text('video-999', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../playControler/play_controler.dart';

class LiveList extends StatefulWidget {
  @override
  _LiveListState createState() => new _LiveListState();
}

class _LiveListState extends State<LiveList> {
  PageController _controller;
  // int _index = 0;
  List videos = [
    'http://wqs.jd.com/promote/superfestival/superfestival.mp4',
    'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
    'https://media.w3.org/2010/05/sintel/trailer.mp4',
    'http://vjs.zencdn.net/v/oceans.mp4'
  ];

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
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return PlayControler(videos[i]);
      },
      itemCount: videos.length,
    );
  }

}
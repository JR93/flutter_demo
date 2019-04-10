import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage(this.url, { Key key }) : super(key: key);

  final String url;

  @override
  PlayerPageState createState() => PlayerPageState();
}

class PlayerPageState extends State<PlayerPage> {
  VideoPlayerController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _index = 1;
    });
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        _controller.setLooping(true);
        setState(() {
          _controller.play();
          _index = 0;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  play() {
    if (!_controller.value.isPlaying) {
      _controller.play();
    }
  }

  pause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      foregroundDecoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.1)
      ),
      child: IndexedStack(
        index: _index,
        children: <Widget>[
          Center(
            child: AspectRatio(
              aspectRatio: widget.url.contains('superfestival') ? 0.5 : _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
          Center(
            child: Image.network('https://zymsc.bs2cdn.yy.com/9d8a888f-34ee-4ebb-a00e-97e2608cd6d3.png'),
          )
        ],
      ),
    );
  }
}
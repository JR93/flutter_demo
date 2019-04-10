import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayControler extends StatefulWidget {
  PlayControler(this.url, { Key key }) : super(key: key);

  final String url;

  @override
  _PlayControlerState createState() => _PlayControlerState();
}

class _PlayControlerState extends State<PlayControler> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.value.isPlaying
            ? _controller.pause()
            : _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
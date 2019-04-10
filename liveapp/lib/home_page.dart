import 'package:flutter/material.dart';
import './live/live_page.dart';
import './video/video_page.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  int _index = 0;

  GlobalKey<VideoPageState> videoPageStateKey = new GlobalKey();

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: <Widget>[
                LivePage(),
                VideoPage(key: videoPageStateKey)
              ],
              onPageChanged: (index) {
                setState(() {
                  _index = index;
                });
                if (index == 0) {
                  if (videoPageStateKey.currentState != null) {
                    videoPageStateKey.currentState.stop();
                  }
                } else {
                  if (videoPageStateKey.currentState != null) {
                    videoPageStateKey.currentState.play();
                  }
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 10.0
              ),
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _controller.jumpToPage(0),
                    child: NavText('看直播', _index == 0),
                  ),
                  Container(
                    width: 0.5,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(200, 255, 255, 255)
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _controller.jumpToPage(1),
                    child: NavText('短视频', _index == 1),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class NavText extends StatelessWidget {
  NavText(this.title, this.active);
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : Colors.white70,
          fontSize: 16.0,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0.4, 0.4),
              blurRadius: 3.0,
              color: Color.fromARGB(150, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
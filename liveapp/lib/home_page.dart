import 'package:flutter/material.dart';
import './livePage/live_page.dart';
import './videoPage/video_page.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  int _index = 0;

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
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              LivePage(),
              VideoPage()
            ],
            onPageChanged: (index){
              setState(() {
                _index = index;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom
              ),
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('看直播', style: TextStyle(color: _index == 0 ? Colors.white : Colors.grey),),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(100, 255, 255, 255)
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('短视频', style: TextStyle(color: _index == 1 ? Colors.white : Colors.grey),),
                    ),
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
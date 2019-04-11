import 'package:flutter/material.dart';
// import './video_list.dart';
import '../player/player_page.dart';

class VideoPage extends StatefulWidget {
  VideoPage({ Key key }) : super(key: key);

  @override
  VideoPageState createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> with AutomaticKeepAliveClientMixin {
  PageController _controller;

  GlobalKey<VideoListState> videoListStateKey = new GlobalKey();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = new PageController();
  }

  pause() {
    if (videoListStateKey.currentState != null) {
      videoListStateKey.currentState.pause();
    }
  }

  play() {
    if (videoListStateKey.currentState != null) {
      videoListStateKey.currentState.play();
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: _controller,
        // physics: null,
        children: <Widget>[
          VideoList(key: videoListStateKey),
          Center(
            child: Text('视频推荐列表-待续', style: TextStyle(color: Colors.white)),
          ),
        ],
        onPageChanged: (i) {
          print('短视频左右切换: $i');
          if (i == 0) {
            play();
          } else {
            pause();
          }
        },
      ),
    );
  }
}

class VideoList extends StatefulWidget {
  VideoList({ Key key }) : super(key: key);

  @override
  VideoListState createState() => new VideoListState();
}

class VideoListState extends State<VideoList> with AutomaticKeepAliveClientMixin {
  PageController _controller;
  List videos = [
    'https://wqs.jd.com/promote/superfestival/superfestival.mp4',
    'https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
    // 'https://media.w3.org/2010/05/sintel/trailer.mp4',
    'https://vjs.zencdn.net/v/oceans.mp4'
  ];
  List<GlobalKey<PlayerPageState>> videoGlobalKeys = [];
  int _curIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = new PageController();
    setState(() {
      videos.forEach((f) {
        videoGlobalKeys.add(new GlobalKey());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  pause() {
    print('短视频左右切换调用: $_curIndex');
    print('短视频左右切换调用: ${videoGlobalKeys[_curIndex].currentState}');
    videoGlobalKeys[_curIndex].currentState.pause();
  }

  play() {
    print('短视频左右切换调用: $_curIndex');
    print('短视频左右切换调用: ${videoGlobalKeys[_curIndex].currentState}');
    videoGlobalKeys[_curIndex].currentState.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        // physics: BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return Container(
            child: Stack(
              children: <Widget>[
                PlayerPage(videos[i], key: videoGlobalKeys[i],),
                Positioned(
                  width: 50.0,
                  height: 300.0,
                  bottom: 50.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.red
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 34.0,
                          height: 34.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: 1.0
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://mobilelivephoto.bs2dl.yy.com/74829892_1541348778.884423.jpg?imageview/4/0/w/180/h/180/blur/1'),
                            )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.favorite, size: 36.0, color: Colors.white,),
                              Text('123', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.star, size: 36.0, color: Colors.white,),
                              Text('123', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.share, size: 30.0, color: Colors.white,),
                              Text('123', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          );
        },
        itemCount: videos.length,
        onPageChanged: (i) {
          print('上下滑动: $i');
          setState(() {
            _curIndex = i;
          });
          videoGlobalKeys[i].currentState.play();
          if (i - 1 >= 0) {
            PlayerPageState videoPalyViewState =
                videoGlobalKeys[i - 1].currentState;
            if (videoPalyViewState != null) videoPalyViewState.pause();
          }
          if (i + 1 < videos.length) {
            PlayerPageState videoPalyViewState =
                videoGlobalKeys[i + 1].currentState;
            if (videoPalyViewState != null) videoPalyViewState.pause();
          }
        },
      ),
    );
  }
}


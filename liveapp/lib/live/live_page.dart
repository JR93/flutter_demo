import 'package:flutter/material.dart';
import '../player/player_page.dart';

class LivePage extends StatefulWidget {
  LivePage({ Key key }) : super(key: key);

  @override
  LivePageState createState() => new LivePageState();
}

class LivePageState extends State<LivePage> with AutomaticKeepAliveClientMixin {
  PageController _controller;

  GlobalKey<_LiveListState> liveListStateKey = new GlobalKey();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = new PageController();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  pause() {
    if (liveListStateKey.currentState != null) {
      liveListStateKey.currentState.pause();
    }
  }

  play() {
    if (liveListStateKey.currentState != null) {
      liveListStateKey.currentState.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: _controller,
        // physics: null,
        // physics: ClampingScrollPhysics(),
        children: <Widget>[
          LiveList(key: liveListStateKey),
          Center(
            child: Text('直播推荐列表-待续', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class LiveList extends StatefulWidget {
  LiveList({ Key key }) : super(key: key);

  @override
  _LiveListState createState() => new _LiveListState();
}

class _LiveListState extends State<LiveList> with AutomaticKeepAliveClientMixin {
  PageController _controller;
  List videos = [
    'https://wqs.jd.com/promote/superfestival/superfestival.mp4',
    'https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
    // 'https://media.w3.org/2010/05/sintel/trailer.mp4',
    'https://vjs.zencdn.net/v/oceans.mp4'
  ];
  List<GlobalKey<PlayerPageState>> liveGlobalKeys = [];
  int _curIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = new PageController();
    setState(() {
      videos.forEach((f) {
        liveGlobalKeys.add(new GlobalKey());
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
    print('短视频左右切换调用: ${liveGlobalKeys[_curIndex].currentState}');
    liveGlobalKeys[_curIndex].currentState.pause();
  }

  play() {
    print('短视频左右切换调用: $_curIndex');
    print('短视频左右切换调用: ${liveGlobalKeys[_curIndex].currentState}');
    liveGlobalKeys[_curIndex].currentState.play();
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
                PlayerPage(videos[i], key: liveGlobalKeys[i],),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 40.0,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      // color: Colors.red
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 32.0,
                          padding: const EdgeInsets.fromLTRB(2.0, 0.0, 8.0, 0.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            borderRadius: BorderRadius.circular(16.0)
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 28.0,
                                height: 28.0,
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
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('毕加索毕加索', style: TextStyle(fontSize: 12.0, color: Colors.white),),
                                    Text('在线: 666', style: TextStyle(fontSize: 8.0, color: Colors.white),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'ID: 4528',
                          style: TextStyle(
                            color: Colors.white, fontSize: 14.0,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.4, 0.4),
                                blurRadius: 3.0,
                                color: Color.fromARGB(150, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
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
          liveGlobalKeys[i].currentState.play();
          if (i - 1 >= 0) {
            PlayerPageState videoPalyViewState =
                liveGlobalKeys[i - 1].currentState;
            if (videoPalyViewState != null) videoPalyViewState.pause();
          }
          if (i + 1 < videos.length) {
            PlayerPageState videoPalyViewState =
                liveGlobalKeys[i + 1].currentState;
            if (videoPalyViewState != null) videoPalyViewState.pause();
          }
        },
      ),
    );
  }
}
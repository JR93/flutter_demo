import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class News extends StatefulWidget {
  const News({Key key, this.data}) : super(key: key);
  final String data;

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

// 定义TAB页对象
class NewsTab {
  String text;
  NewsList newsList;
  NewsTab(this.text,this.newsList);
}

class _MyTabbedPageState extends State<News> with SingleTickerProviderStateMixin {
  final List<NewsTab> myTabs = <NewsTab>[
    NewsTab('头条', NewsList(newsType: 'toutiao')),
    NewsTab('社会', NewsList(newsType: 'shehui')),
    NewsTab('国内', NewsList(newsType: 'guonei')),
    NewsTab('国际', NewsList(newsType: 'guoji')),
    NewsTab('娱乐', NewsList(newsType: 'yule')),
    NewsTab('体育', NewsList(newsType: 'tiyu')),
    NewsTab('军事', NewsList(newsType: 'junshi')),
    NewsTab('科技', NewsList(newsType: 'keji')),
    NewsTab('财经', NewsList(newsType: 'caijing')),
    NewsTab('时尚', NewsList(newsType: 'shishang')),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: TabBar(
          controller: _tabController,
          tabs: myTabs.map((NewsTab item){
            return Tab(text: item.text??'错误');
          }).toList(),
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((NewsTab item) {
          return item.newsList; //使用参数值
        }).toList(),
      ),
    );
  }
}

class NewsList extends StatefulWidget {
  final String newsType;
  NewsList({Key key, this.newsType}) :super(key: key);

  @override
  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final String _url = 'http://v.juhe.cn/toutiao/index?';
  List data;

  Future<String> get(String category) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse('${_url}type=$category&key=3a86f36bd3ecac8a51135ded5eebe862'));
    var response = await request.close();
    print(response);
    return await response.transform(utf8.decoder).join();
  }

  Future<Null> loadData() async {
    await get(widget.newsType);
    if (!mounted) return;
    setState(() {}); // 什么都不做，只为触发RefreshIndicator的子控件刷新
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder( //用于懒加载的FutureBuilder对象
        future: get(widget.newsType), //HTTP请求获取数据，将被AsyncSnapshot对象监视
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Card(
                  child: Text('loading...'),
                ),
              );
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return createListView(context, snapshot);
              }
          }
        },
      ),
      onRefresh: loadData,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List values;
    values = jsonDecode(snapshot.data)['result'] != null ? jsonDecode(snapshot.data)['result']['data'] : [''];
    switch (values.length) {
      case 1:
        return Center(
          child: Card(
            child: Text(jsonDecode(snapshot.data)['reason']),
          ),
        );
      default:
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          itemCount: values == null ? 0 : values.length,
          itemBuilder: (context, i) {
            return _newsRow(values[i]);
          },
        );
    }
  }

  Widget _newsRow(newsInfo) {
    return Card(
       child: Column(
         children: <Widget>[
           Container(
             child: ListTile(title: Text(newsInfo['title'], textScaleFactor: 1.5,),),
             margin: EdgeInsets.all(5.0),
           ),
           _generateItem(newsInfo),
           Container(
             padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Expanded(
                   child: Text(newsInfo['author_name']),
                 ),
                 Expanded(
                   child: Text(newsInfo['date']),
                 )
               ],
             ),
           )
         ],
       ),
    );
  }

  _generateItem(Map newsInfo) {
    if (newsInfo['thumbnail_pic_s'] != null && newsInfo['thumbnail_pic_s02'] != null && newsInfo['thumbnail_pic_s03'] != null) {
      return _generateThreePicItem(newsInfo);
    } else {
      return _generateOnePicItem(newsInfo);
    }
  }

  _generateOnePicItem(Map newsInfo) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
              height: 200.0,
              child: Image.network(
                newsInfo['thumbnail_pic_s'],
                fit:BoxFit.fitWidth
              ),
            ),
          ),
        )
      ],
    );
  }

  _generateThreePicItem(Map newsInfo) {
    return Row(
      children: <Widget>[
        new Expanded(
          child: Container(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(newsInfo['thumbnail_pic_s'])
          )
        ),
        new Expanded(
          child: Container(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(newsInfo['thumbnail_pic_s02'])
          )
        ),
        new Expanded(
          child: Container(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(newsInfo['thumbnail_pic_s03'])
          )
        )
      ],
    );
  }
}
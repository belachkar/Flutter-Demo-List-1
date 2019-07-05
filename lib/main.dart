import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './src/hn_bloc.dart';
import './src/article.dart';

void main() {
  final hnBloc = HackerNewsBloc();
  runApp(MyApp(bloc: hnBloc));
}

class MyApp extends StatelessWidget {
  final HackerNewsBloc bloc;

  MyApp({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Flutter Hacker News', bloc: bloc),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final HackerNewsBloc bloc;

  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // leading: CircularProgressIndicator(backgroundColor: Colors.white,),
        leading: LoadingInfo(widget.bloc.isLoading),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        initialData: UnmodifiableListView<Article>([]),
        stream: widget.bloc.articles,
        builder: (context, snapshot) => ListView(
              children: snapshot.data.map(_buildItem).toList(),
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        backgroundColor: Colors.grey[200],
        // type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.teal,
        // unselectedItemColor: Colors.grey,
        currentIndex: _cBottomNavIndex,
        items: [
          BottomNavigationBarItem(
            title: Text('Top Stories'),
            icon: Icon(Icons.arrow_drop_up),
          ),
          BottomNavigationBarItem(
            title: Text('New Stories'),
            icon: Icon(Icons.new_releases),
          )
        ],
        onTap: (index) {
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
          setState(() {
            _cBottomNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildItem(Article article) {
    final String url = article.url;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ExpansionTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 24.0),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                article.type,
                style: TextStyle(fontSize: 16.0),
              ),
              IconButton(
                icon: Icon(Icons.launch),
                color: Colors.green[200],
                onPressed: () async {
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw ('Could not launch $url');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingInfo extends StatefulWidget {
  final Stream<bool> _isLoading;
  LoadingInfo(this._isLoading);

  @override
  _LoadingInfoState createState() => _LoadingInfoState();
}

class _LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: widget._isLoading,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        return FadeTransition(
          child: Icon(FontAwesomeIcons.hackerNewsSquare),
          opacity: Tween(begin: 0.3, end: 1.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutCirc,
          )),
        );
        // return Container();
      },
    );
  }
}

// import 'package:boring_flutter1/src/article.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'src/article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _ids = [20348897, 20348365, 20343728, 20348531];

  Future<Article> _getArticle(int id) async {
    final articleUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final res = await http.get(articleUrl);
    if (res.statusCode == 200) {
      return parseArticle(res.body);
    } else {
      throw 'Unable to connect, StatusCode: ${res.statusCode}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        // children: _ids.map(_buildItem).toList(),
        children: _ids
            .map((id) => FutureBuilder<Article>(
                  future: _getArticle(id),
                  builder:
                      (BuildContext context, AsyncSnapshot<Article> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return _buildItem(snapshot.data);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ))
            .toList(),
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
            children: <Widget>[
              Text(
                article.type,
                style: TextStyle(fontSize: 16.0),
              ),
              MaterialButton(
                child: Text('OPEN'),
                color: Colors.green,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.flag),
                color: Colors.green,
                onPressed: () async {
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw ('Could not launch $url');
                  }
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      ),
    );
  }
}

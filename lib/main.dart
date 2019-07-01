import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'src/country.dart';

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
  List<Country> _countries = countries;

  Widget _buildItem(Country country) {
    final String url = country.flag;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ExpansionTile(
        title: Text(
          country.name,
          style: TextStyle(fontSize: 24.0),
        ),
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                country.subregion,
                style: TextStyle(fontSize: 16.0),
              ),
              MaterialButton(
                child: Text('OPEN'),
                color: Colors.green,
                onPressed: () {
                  
                },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('REFRESHED'),
            ),
          );
        },
        child: ListView(
          children: _countries.map(_buildItem).toList(),
        ),
      ),
    );
  }
}

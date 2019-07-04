import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

import 'package:boring_flutter1/src/article.dart';

class HackerNewsBloc {
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  var _articles = <Article>[];

  List<int> _ids = [20348897, 20348365, 20343728, 20348531];

  HackerNewsBloc() {
    _updateArticles().then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  Future<Null> _updateArticles() async {
    final articles = await Future.wait(_ids.map((id) => _getArticle(id)));
    _articles = articles;
  }

  Future<Article> _getArticle(int id) async {
    final articleUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final res = await http.get(articleUrl);
    if (res.statusCode == 200) {
      return parseArticle(res.body);
    } else {
      throw 'Unable to connect, StatusCode: ${res.statusCode}';
    }
  }
}

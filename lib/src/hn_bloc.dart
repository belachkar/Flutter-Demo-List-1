import 'dart:async';
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

import './article.dart';

enum StoriesType { topStories, newStories }

class HackerNewsBloc {
  List<int> _newIds = [20348897, 20348365, 20343728, 20348531];
  List<int> _topIds = [20355942, 20357055, 20356808, 20355914, 20352439];

  var _articles = <Article>[];

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  final _storiesTypeController = StreamController<StoriesType>();
  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  HackerNewsBloc() {
    _getArticlesAndUpdate(List<int> ids) {
      _updateArticles(ids).then((_) {
        print(_articles);
        _articlesSubject.add(UnmodifiableListView(_articles));
      });
    }

    _storiesTypeController.stream.listen((storiesType) {
      switch (storiesType) {
        case StoriesType.newStories:
          print('storiesType changed: new stories');
          _getArticlesAndUpdate(_newIds);
          break;
        case StoriesType.topStories:
          print('storiesType changed: top stories');
          _getArticlesAndUpdate(_topIds);
          break;
      }
    });

    _getArticlesAndUpdate(_newIds);
  }

  Future<Null> _updateArticles(List<int> articleIds) async {
    _articles = await Future.wait(articleIds.map((id) => _getArticle(id)));
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

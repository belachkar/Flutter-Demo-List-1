import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import './serializers.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  @nullable
  int get id;

  @nullable
  bool get deleted;

  /// The type of articles. One of "job", "story", "comment", "poll", or "pollopt".
  String get type;

  @nullable
  String get by;

  @nullable
  int get time;

  @nullable
  String get text;

  @nullable
  bool get dead;

  @nullable
  String get parent;

  @nullable
  String get poll;

  @nullable
  BuiltList<int> get kids;

  @nullable
  String get url;

  @nullable
  int get score;

  @nullable
  String get title;

  @nullable
  BuiltList<int> get parts;

  @nullable
  int get descendants;

  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

List<int> parseTopStories(String jsonString) {
  final parsed = jsonDecode(jsonString);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Article parseArticle(String jsonString) {
  /// Using JSON and manual class constructor implemantation.
  // final parsed = jsonDecode(jsonString);
  // Article Article = Article.fromJson(parsed);
  // return Article;

  /// Using "Built_value" package for serialization.
  final parsed = jsonDecode(jsonString);
  return serializers.deserializeWith(Article.serializer, parsed);
}

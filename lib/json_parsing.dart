import 'package:boring_flutter1/src/item.dart';
import 'dart:convert';

List<int> parseTopStories(String jsonString) {
  final parsed = jsonDecode(jsonString);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Item parseItem(String jsonString) {
  final parsed = jsonDecode(jsonString);
  Item item = Item.fromJson(parsed);
  return item;
}

// import 'package:boring_flutter1/src/item.dart';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'json_parsing.g.dart';

abstract class Item implements Built<Item, ItemBuilder> {
  static Serializer<Item> get serializer => _$itemSerializer;

  @nullable
  String get by;

  @nullable
  int get descendants;

  @nullable
  int get id;

  @nullable
  BuiltList<int> get kids;

  @nullable
  BuiltList<int> get parts;

  @nullable
  int get score;

  @nullable
  String get text;

  @nullable
  int get time;

  @nullable
  String get title;

  @nullable
  String get type;

  Item._();
  factory Item([void Function(ItemBuilder) updates]) = _$Item;
}

List<int> parseTopStories(String jsonString) {
  final parsed = jsonDecode(jsonString);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Item parseItem(String jsonString) {

  /// Using JSON and manual class constructor implemantation.
  // final parsed = jsonDecode(jsonString);
  // Item item = Item.fromJson(parsed);
  // return item;

  /// Using "Built_value" package for serialization.
  final parsed = jsonDecode(jsonString);
  Item item = serializers.deserializeWith(Item.serializer, parsed);
  return item;
}

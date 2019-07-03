library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'json_parsing.dart';

part 'serializers.g.dart';

@SerializersFor([
  Item,
])
/// Used if no need for JSOn serialization
// final Serializers serializers = _$serializers;

/// Adding the JSOn plugin for JSON serialization and deserialization
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
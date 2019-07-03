// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_parsing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Item> _$itemSerializer = new _$ItemSerializer();

class _$ItemSerializer implements StructuredSerializer<Item> {
  @override
  final Iterable<Type> types = const [Item, _$Item];
  @override
  final String wireName = 'Item';

  @override
  Iterable serialize(Serializers serializers, Item object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.by != null) {
      result
        ..add('by')
        ..add(serializers.serialize(object.by,
            specifiedType: const FullType(String)));
    }
    if (object.descendants != null) {
      result
        ..add('descendants')
        ..add(serializers.serialize(object.descendants,
            specifiedType: const FullType(int)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.kids != null) {
      result
        ..add('kids')
        ..add(serializers.serialize(object.kids,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.parts != null) {
      result
        ..add('parts')
        ..add(serializers.serialize(object.parts,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.score != null) {
      result
        ..add('score')
        ..add(serializers.serialize(object.score,
            specifiedType: const FullType(int)));
    }
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(int)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Item deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'descendants':
          result.descendants = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'kids':
          result.kids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'parts':
          result.parts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Item extends Item {
  @override
  final String by;
  @override
  final int descendants;
  @override
  final int id;
  @override
  final BuiltList<int> kids;
  @override
  final BuiltList<int> parts;
  @override
  final int score;
  @override
  final String text;
  @override
  final int time;
  @override
  final String title;
  @override
  final String type;

  factory _$Item([void Function(ItemBuilder) updates]) =>
      (new ItemBuilder()..update(updates)).build();

  _$Item._(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.parts,
      this.score,
      this.text,
      this.time,
      this.title,
      this.type})
      : super._();

  @override
  Item rebuild(void Function(ItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemBuilder toBuilder() => new ItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Item &&
        by == other.by &&
        descendants == other.descendants &&
        id == other.id &&
        kids == other.kids &&
        parts == other.parts &&
        score == other.score &&
        text == other.text &&
        time == other.time &&
        title == other.title &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, by.hashCode),
                                        descendants.hashCode),
                                    id.hashCode),
                                kids.hashCode),
                            parts.hashCode),
                        score.hashCode),
                    text.hashCode),
                time.hashCode),
            title.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Item')
          ..add('by', by)
          ..add('descendants', descendants)
          ..add('id', id)
          ..add('kids', kids)
          ..add('parts', parts)
          ..add('score', score)
          ..add('text', text)
          ..add('time', time)
          ..add('title', title)
          ..add('type', type))
        .toString();
  }
}

class ItemBuilder implements Builder<Item, ItemBuilder> {
  _$Item _$v;

  String _by;
  String get by => _$this._by;
  set by(String by) => _$this._by = by;

  int _descendants;
  int get descendants => _$this._descendants;
  set descendants(int descendants) => _$this._descendants = descendants;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<int> _kids;
  ListBuilder<int> get kids => _$this._kids ??= new ListBuilder<int>();
  set kids(ListBuilder<int> kids) => _$this._kids = kids;

  ListBuilder<int> _parts;
  ListBuilder<int> get parts => _$this._parts ??= new ListBuilder<int>();
  set parts(ListBuilder<int> parts) => _$this._parts = parts;

  int _score;
  int get score => _$this._score;
  set score(int score) => _$this._score = score;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  ItemBuilder();

  ItemBuilder get _$this {
    if (_$v != null) {
      _by = _$v.by;
      _descendants = _$v.descendants;
      _id = _$v.id;
      _kids = _$v.kids?.toBuilder();
      _parts = _$v.parts?.toBuilder();
      _score = _$v.score;
      _text = _$v.text;
      _time = _$v.time;
      _title = _$v.title;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Item other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Item;
  }

  @override
  void update(void Function(ItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Item build() {
    _$Item _$result;
    try {
      _$result = _$v ??
          new _$Item._(
              by: by,
              descendants: descendants,
              id: id,
              kids: _kids?.build(),
              parts: _parts?.build(),
              score: score,
              text: text,
              time: time,
              title: title,
              type: type);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'kids';
        _kids?.build();
        _$failedField = 'parts';
        _parts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Item', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

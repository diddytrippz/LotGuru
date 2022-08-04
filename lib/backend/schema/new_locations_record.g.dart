// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_locations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewLocationsRecord> _$newLocationsRecordSerializer =
    new _$NewLocationsRecordSerializer();

class _$NewLocationsRecordSerializer
    implements StructuredSerializer<NewLocationsRecord> {
  @override
  final Iterable<Type> types = const [NewLocationsRecord, _$NewLocationsRecord];
  @override
  final String wireName = 'NewLocationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NewLocationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.addLocations;
    if (value != null) {
      result
        ..add('addLocations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  NewLocationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewLocationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'addLocations':
          result.addLocations = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$NewLocationsRecord extends NewLocationsRecord {
  @override
  final String? addLocations;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NewLocationsRecord(
          [void Function(NewLocationsRecordBuilder)? updates]) =>
      (new NewLocationsRecordBuilder()..update(updates))._build();

  _$NewLocationsRecord._({this.addLocations, this.ffRef}) : super._();

  @override
  NewLocationsRecord rebuild(
          void Function(NewLocationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewLocationsRecordBuilder toBuilder() =>
      new NewLocationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewLocationsRecord &&
        addLocations == other.addLocations &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, addLocations.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewLocationsRecord')
          ..add('addLocations', addLocations)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NewLocationsRecordBuilder
    implements Builder<NewLocationsRecord, NewLocationsRecordBuilder> {
  _$NewLocationsRecord? _$v;

  String? _addLocations;
  String? get addLocations => _$this._addLocations;
  set addLocations(String? addLocations) => _$this._addLocations = addLocations;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NewLocationsRecordBuilder() {
    NewLocationsRecord._initializeBuilder(this);
  }

  NewLocationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addLocations = $v.addLocations;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewLocationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewLocationsRecord;
  }

  @override
  void update(void Function(NewLocationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewLocationsRecord build() => _build();

  _$NewLocationsRecord _build() {
    final _$result = _$v ??
        new _$NewLocationsRecord._(addLocations: addLocations, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

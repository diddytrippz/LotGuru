// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InventoryRecord> _$inventoryRecordSerializer =
    new _$InventoryRecordSerializer();

class _$InventoryRecordSerializer
    implements StructuredSerializer<InventoryRecord> {
  @override
  final Iterable<Type> types = const [InventoryRecord, _$InventoryRecord];
  @override
  final String wireName = 'InventoryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, InventoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.make;
    if (value != null) {
      result
        ..add('make')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.vin;
    if (value != null) {
      result
        ..add('vin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.model;
    if (value != null) {
      result
        ..add('model')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('Type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stock;
    if (value != null) {
      result
        ..add('stock')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.geoLocation;
    if (value != null) {
      result
        ..add('geoLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.currentLoc;
    if (value != null) {
      result
        ..add('currentLoc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isClaimed;
    if (value != null) {
      result
        ..add('isClaimed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.claimedBy;
    if (value != null) {
      result
        ..add('claimedBy')
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
  InventoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InventoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'make':
          result.make = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'vin':
          result.vin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'stock':
          result.stock = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'geoLocation':
          result.geoLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'currentLoc':
          result.currentLoc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isClaimed':
          result.isClaimed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'claimedBy':
          result.claimedBy = serializers.deserialize(value,
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

class _$InventoryRecord extends InventoryRecord {
  @override
  final String? make;
  @override
  final String? notes;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? vin;
  @override
  final String? model;
  @override
  final String? type;
  @override
  final String? stock;
  @override
  final LatLng? geoLocation;
  @override
  final String? currentLoc;
  @override
  final bool? isClaimed;
  @override
  final String? claimedBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InventoryRecord([void Function(InventoryRecordBuilder)? updates]) =>
      (new InventoryRecordBuilder()..update(updates))._build();

  _$InventoryRecord._(
      {this.make,
      this.notes,
      this.user,
      this.vin,
      this.model,
      this.type,
      this.stock,
      this.geoLocation,
      this.currentLoc,
      this.isClaimed,
      this.claimedBy,
      this.ffRef})
      : super._();

  @override
  InventoryRecord rebuild(void Function(InventoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryRecordBuilder toBuilder() =>
      new InventoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryRecord &&
        make == other.make &&
        notes == other.notes &&
        user == other.user &&
        vin == other.vin &&
        model == other.model &&
        type == other.type &&
        stock == other.stock &&
        geoLocation == other.geoLocation &&
        currentLoc == other.currentLoc &&
        isClaimed == other.isClaimed &&
        claimedBy == other.claimedBy &&
        ffRef == other.ffRef;
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
                                    $jc(
                                        $jc(
                                            $jc($jc(0, make.hashCode),
                                                notes.hashCode),
                                            user.hashCode),
                                        vin.hashCode),
                                    model.hashCode),
                                type.hashCode),
                            stock.hashCode),
                        geoLocation.hashCode),
                    currentLoc.hashCode),
                isClaimed.hashCode),
            claimedBy.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventoryRecord')
          ..add('make', make)
          ..add('notes', notes)
          ..add('user', user)
          ..add('vin', vin)
          ..add('model', model)
          ..add('type', type)
          ..add('stock', stock)
          ..add('geoLocation', geoLocation)
          ..add('currentLoc', currentLoc)
          ..add('isClaimed', isClaimed)
          ..add('claimedBy', claimedBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InventoryRecordBuilder
    implements Builder<InventoryRecord, InventoryRecordBuilder> {
  _$InventoryRecord? _$v;

  String? _make;
  String? get make => _$this._make;
  set make(String? make) => _$this._make = make;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _vin;
  String? get vin => _$this._vin;
  set vin(String? vin) => _$this._vin = vin;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _stock;
  String? get stock => _$this._stock;
  set stock(String? stock) => _$this._stock = stock;

  LatLng? _geoLocation;
  LatLng? get geoLocation => _$this._geoLocation;
  set geoLocation(LatLng? geoLocation) => _$this._geoLocation = geoLocation;

  String? _currentLoc;
  String? get currentLoc => _$this._currentLoc;
  set currentLoc(String? currentLoc) => _$this._currentLoc = currentLoc;

  bool? _isClaimed;
  bool? get isClaimed => _$this._isClaimed;
  set isClaimed(bool? isClaimed) => _$this._isClaimed = isClaimed;

  String? _claimedBy;
  String? get claimedBy => _$this._claimedBy;
  set claimedBy(String? claimedBy) => _$this._claimedBy = claimedBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InventoryRecordBuilder() {
    InventoryRecord._initializeBuilder(this);
  }

  InventoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _make = $v.make;
      _notes = $v.notes;
      _user = $v.user;
      _vin = $v.vin;
      _model = $v.model;
      _type = $v.type;
      _stock = $v.stock;
      _geoLocation = $v.geoLocation;
      _currentLoc = $v.currentLoc;
      _isClaimed = $v.isClaimed;
      _claimedBy = $v.claimedBy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InventoryRecord;
  }

  @override
  void update(void Function(InventoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryRecord build() => _build();

  _$InventoryRecord _build() {
    final _$result = _$v ??
        new _$InventoryRecord._(
            make: make,
            notes: notes,
            user: user,
            vin: vin,
            model: model,
            type: type,
            stock: stock,
            geoLocation: geoLocation,
            currentLoc: currentLoc,
            isClaimed: isClaimed,
            claimedBy: claimedBy,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

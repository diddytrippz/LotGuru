import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'inventory_record.g.dart';

abstract class InventoryRecord
    implements Built<InventoryRecord, InventoryRecordBuilder> {
  static Serializer<InventoryRecord> get serializer =>
      _$inventoryRecordSerializer;

  String? get make;

  String? get notes;

  DocumentReference? get user;

  String? get vin;

  String? get model;

  @BuiltValueField(wireName: 'Type')
  String? get type;

  String? get stock;

  LatLng? get geoLocation;

  String? get currentLoc;

  bool? get isClaimed;

  String? get claimedBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InventoryRecordBuilder builder) => builder
    ..make = ''
    ..notes = ''
    ..vin = ''
    ..model = ''
    ..type = ''
    ..stock = ''
    ..currentLoc = ''
    ..isClaimed = false
    ..claimedBy = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventory');

  static Stream<InventoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InventoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InventoryRecord._();
  factory InventoryRecord([void Function(InventoryRecordBuilder) updates]) =
      _$InventoryRecord;

  static InventoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInventoryRecordData({
  String? make,
  String? notes,
  DocumentReference? user,
  String? vin,
  String? model,
  String? type,
  String? stock,
  LatLng? geoLocation,
  String? currentLoc,
  bool? isClaimed,
  String? claimedBy,
}) {
  final firestoreData = serializers.toFirestore(
    InventoryRecord.serializer,
    InventoryRecord(
      (i) => i
        ..make = make
        ..notes = notes
        ..user = user
        ..vin = vin
        ..model = model
        ..type = type
        ..stock = stock
        ..geoLocation = geoLocation
        ..currentLoc = currentLoc
        ..isClaimed = isClaimed
        ..claimedBy = claimedBy,
    ),
  );

  return firestoreData;
}

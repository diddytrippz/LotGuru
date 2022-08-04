import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'new_locations_record.g.dart';

abstract class NewLocationsRecord
    implements Built<NewLocationsRecord, NewLocationsRecordBuilder> {
  static Serializer<NewLocationsRecord> get serializer =>
      _$newLocationsRecordSerializer;

  String? get addLocations;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(NewLocationsRecordBuilder builder) =>
      builder..addLocations = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('newLocations')
          : FirebaseFirestore.instance.collectionGroup('newLocations');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('newLocations').doc();

  static Stream<NewLocationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NewLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NewLocationsRecord._();
  factory NewLocationsRecord(
          [void Function(NewLocationsRecordBuilder) updates]) =
      _$NewLocationsRecord;

  static NewLocationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNewLocationsRecordData({
  String? addLocations,
}) {
  final firestoreData = serializers.toFirestore(
    NewLocationsRecord.serializer,
    NewLocationsRecord(
      (n) => n..addLocations = addLocations,
    ),
  );

  return firestoreData;
}

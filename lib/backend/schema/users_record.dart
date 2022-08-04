import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get firstName;

  String? get lastName;

  int? get phone;

  String? get streetAddress;

  String? get apartment;

  String? get city;

  int? get zip;

  String? get state;

  BuiltList<String>? get role;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get business;

  BuiltList<String>? get access;

  bool? get isAccountHolder;

  BuiltList<String>? get locationLabel;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..uid = ''
    ..firstName = ''
    ..lastName = ''
    ..phone = 0
    ..streetAddress = ''
    ..apartment = ''
    ..city = ''
    ..zip = 0
    ..state = ''
    ..role = ListBuilder()
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..business = ''
    ..access = ListBuilder()
    ..isAccountHolder = false
    ..locationLabel = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? firstName,
  String? lastName,
  int? phone,
  String? streetAddress,
  String? apartment,
  String? city,
  int? zip,
  String? state,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? business,
  bool? isAccountHolder,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..uid = uid
        ..createdTime = createdTime
        ..firstName = firstName
        ..lastName = lastName
        ..phone = phone
        ..streetAddress = streetAddress
        ..apartment = apartment
        ..city = city
        ..zip = zip
        ..state = state
        ..role = null
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..phoneNumber = phoneNumber
        ..business = business
        ..access = null
        ..isAccountHolder = isAccountHolder
        ..locationLabel = null,
    ),
  );

  return firestoreData;
}

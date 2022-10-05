import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_login_record.g.dart';

abstract class UsersLoginRecord
    implements Built<UsersLoginRecord, UsersLoginRecordBuilder> {
  static Serializer<UsersLoginRecord> get serializer =>
      _$usersLoginRecordSerializer;

  @BuiltValueField(wireName: 'E-mail')
  String? get eMail;

  @BuiltValueField(wireName: 'Senha')
  String? get senha;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersLoginRecordBuilder builder) => builder
    ..eMail = ''
    ..senha = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_login');

  static Stream<UsersLoginRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersLoginRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersLoginRecord._();
  factory UsersLoginRecord([void Function(UsersLoginRecordBuilder) updates]) =
      _$UsersLoginRecord;

  static UsersLoginRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersLoginRecordData({
  String? eMail,
  String? senha,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = serializers.toFirestore(
    UsersLoginRecord.serializer,
    UsersLoginRecord(
      (u) => u
        ..eMail = eMail
        ..senha = senha
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber,
    ),
  );

  return firestoreData;
}

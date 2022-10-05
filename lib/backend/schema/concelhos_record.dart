import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'concelhos_record.g.dart';

abstract class ConcelhosRecord
    implements Built<ConcelhosRecord, ConcelhosRecordBuilder> {
  static Serializer<ConcelhosRecord> get serializer =>
      _$concelhosRecordSerializer;

  String? get concelho;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConcelhosRecordBuilder builder) =>
      builder..concelho = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('concelhos');

  static Stream<ConcelhosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConcelhosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConcelhosRecord._();
  factory ConcelhosRecord([void Function(ConcelhosRecordBuilder) updates]) =
      _$ConcelhosRecord;

  static ConcelhosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConcelhosRecordData({
  String? concelho,
}) {
  final firestoreData = serializers.toFirestore(
    ConcelhosRecord.serializer,
    ConcelhosRecord(
      (c) => c..concelho = concelho,
    ),
  );

  return firestoreData;
}

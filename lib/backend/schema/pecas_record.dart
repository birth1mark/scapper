import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pecas_record.g.dart';

abstract class PecasRecord implements Built<PecasRecord, PecasRecordBuilder> {
  static Serializer<PecasRecord> get serializer => _$pecasRecordSerializer;

  String? get imagePeca;

  String? get referenciaPeca;

  int? get anoPeca;

  String? get localizacaoPeca;

  String? get decricaoPeca;

  double? get valorPeca;

  String? get uuidProprietario;

  String? get uid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PecasRecordBuilder builder) => builder
    ..imagePeca = ''
    ..referenciaPeca = ''
    ..anoPeca = 0
    ..localizacaoPeca = ''
    ..decricaoPeca = ''
    ..valorPeca = 0.0
    ..uuidProprietario = ''
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pecas');

  static Stream<PecasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PecasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PecasRecord._();
  factory PecasRecord([void Function(PecasRecordBuilder) updates]) =
      _$PecasRecord;

  static PecasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPecasRecordData({
  String? imagePeca,
  String? referenciaPeca,
  int? anoPeca,
  String? localizacaoPeca,
  String? decricaoPeca,
  double? valorPeca,
  String? uuidProprietario,
  String? uid,
}) {
  final firestoreData = serializers.toFirestore(
    PecasRecord.serializer,
    PecasRecord(
      (p) => p
        ..imagePeca = imagePeca
        ..referenciaPeca = referenciaPeca
        ..anoPeca = anoPeca
        ..localizacaoPeca = localizacaoPeca
        ..decricaoPeca = decricaoPeca
        ..valorPeca = valorPeca
        ..uuidProprietario = uuidProprietario
        ..uid = uid,
    ),
  );

  return firestoreData;
}

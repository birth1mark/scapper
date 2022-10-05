import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'compras_record.g.dart';

abstract class ComprasRecord
    implements Built<ComprasRecord, ComprasRecordBuilder> {
  static Serializer<ComprasRecord> get serializer => _$comprasRecordSerializer;

  @BuiltValueField(wireName: 'uid_comprador')
  String? get uidComprador;

  @BuiltValueField(wireName: 'uid_vendedor')
  String? get uidVendedor;

  @BuiltValueField(wireName: 'ref_peca')
  String? get refPeca;

  String? get mensagem;

  @BuiltValueField(wireName: 'valor_compra')
  double? get valorCompra;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ComprasRecordBuilder builder) => builder
    ..uidComprador = ''
    ..uidVendedor = ''
    ..refPeca = ''
    ..mensagem = ''
    ..valorCompra = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('compras');

  static Stream<ComprasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ComprasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ComprasRecord._();
  factory ComprasRecord([void Function(ComprasRecordBuilder) updates]) =
      _$ComprasRecord;

  static ComprasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createComprasRecordData({
  String? uidComprador,
  String? uidVendedor,
  String? refPeca,
  String? mensagem,
  double? valorCompra,
}) {
  final firestoreData = serializers.toFirestore(
    ComprasRecord.serializer,
    ComprasRecord(
      (c) => c
        ..uidComprador = uidComprador
        ..uidVendedor = uidVendedor
        ..refPeca = refPeca
        ..mensagem = mensagem
        ..valorCompra = valorCompra,
    ),
  );

  return firestoreData;
}

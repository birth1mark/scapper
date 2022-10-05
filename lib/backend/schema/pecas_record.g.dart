// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pecas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PecasRecord> _$pecasRecordSerializer = new _$PecasRecordSerializer();

class _$PecasRecordSerializer implements StructuredSerializer<PecasRecord> {
  @override
  final Iterable<Type> types = const [PecasRecord, _$PecasRecord];
  @override
  final String wireName = 'PecasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PecasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.imagePeca;
    if (value != null) {
      result
        ..add('imagePeca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.referenciaPeca;
    if (value != null) {
      result
        ..add('referenciaPeca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.anoPeca;
    if (value != null) {
      result
        ..add('anoPeca')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.localizacaoPeca;
    if (value != null) {
      result
        ..add('localizacaoPeca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.decricaoPeca;
    if (value != null) {
      result
        ..add('decricaoPeca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valorPeca;
    if (value != null) {
      result
        ..add('valorPeca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.uuidProprietario;
    if (value != null) {
      result
        ..add('uuidProprietario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
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
  PecasRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PecasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'imagePeca':
          result.imagePeca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'referenciaPeca':
          result.referenciaPeca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'anoPeca':
          result.anoPeca = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'localizacaoPeca':
          result.localizacaoPeca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'decricaoPeca':
          result.decricaoPeca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valorPeca':
          result.valorPeca = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'uuidProprietario':
          result.uuidProprietario = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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

class _$PecasRecord extends PecasRecord {
  @override
  final String? imagePeca;
  @override
  final String? referenciaPeca;
  @override
  final int? anoPeca;
  @override
  final String? localizacaoPeca;
  @override
  final String? decricaoPeca;
  @override
  final double? valorPeca;
  @override
  final String? uuidProprietario;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PecasRecord([void Function(PecasRecordBuilder)? updates]) =>
      (new PecasRecordBuilder()..update(updates))._build();

  _$PecasRecord._(
      {this.imagePeca,
      this.referenciaPeca,
      this.anoPeca,
      this.localizacaoPeca,
      this.decricaoPeca,
      this.valorPeca,
      this.uuidProprietario,
      this.uid,
      this.ffRef})
      : super._();

  @override
  PecasRecord rebuild(void Function(PecasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PecasRecordBuilder toBuilder() => new PecasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PecasRecord &&
        imagePeca == other.imagePeca &&
        referenciaPeca == other.referenciaPeca &&
        anoPeca == other.anoPeca &&
        localizacaoPeca == other.localizacaoPeca &&
        decricaoPeca == other.decricaoPeca &&
        valorPeca == other.valorPeca &&
        uuidProprietario == other.uuidProprietario &&
        uid == other.uid &&
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
                                $jc($jc(0, imagePeca.hashCode),
                                    referenciaPeca.hashCode),
                                anoPeca.hashCode),
                            localizacaoPeca.hashCode),
                        decricaoPeca.hashCode),
                    valorPeca.hashCode),
                uuidProprietario.hashCode),
            uid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PecasRecord')
          ..add('imagePeca', imagePeca)
          ..add('referenciaPeca', referenciaPeca)
          ..add('anoPeca', anoPeca)
          ..add('localizacaoPeca', localizacaoPeca)
          ..add('decricaoPeca', decricaoPeca)
          ..add('valorPeca', valorPeca)
          ..add('uuidProprietario', uuidProprietario)
          ..add('uid', uid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PecasRecordBuilder implements Builder<PecasRecord, PecasRecordBuilder> {
  _$PecasRecord? _$v;

  String? _imagePeca;
  String? get imagePeca => _$this._imagePeca;
  set imagePeca(String? imagePeca) => _$this._imagePeca = imagePeca;

  String? _referenciaPeca;
  String? get referenciaPeca => _$this._referenciaPeca;
  set referenciaPeca(String? referenciaPeca) =>
      _$this._referenciaPeca = referenciaPeca;

  int? _anoPeca;
  int? get anoPeca => _$this._anoPeca;
  set anoPeca(int? anoPeca) => _$this._anoPeca = anoPeca;

  String? _localizacaoPeca;
  String? get localizacaoPeca => _$this._localizacaoPeca;
  set localizacaoPeca(String? localizacaoPeca) =>
      _$this._localizacaoPeca = localizacaoPeca;

  String? _decricaoPeca;
  String? get decricaoPeca => _$this._decricaoPeca;
  set decricaoPeca(String? decricaoPeca) => _$this._decricaoPeca = decricaoPeca;

  double? _valorPeca;
  double? get valorPeca => _$this._valorPeca;
  set valorPeca(double? valorPeca) => _$this._valorPeca = valorPeca;

  String? _uuidProprietario;
  String? get uuidProprietario => _$this._uuidProprietario;
  set uuidProprietario(String? uuidProprietario) =>
      _$this._uuidProprietario = uuidProprietario;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PecasRecordBuilder() {
    PecasRecord._initializeBuilder(this);
  }

  PecasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imagePeca = $v.imagePeca;
      _referenciaPeca = $v.referenciaPeca;
      _anoPeca = $v.anoPeca;
      _localizacaoPeca = $v.localizacaoPeca;
      _decricaoPeca = $v.decricaoPeca;
      _valorPeca = $v.valorPeca;
      _uuidProprietario = $v.uuidProprietario;
      _uid = $v.uid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PecasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PecasRecord;
  }

  @override
  void update(void Function(PecasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PecasRecord build() => _build();

  _$PecasRecord _build() {
    final _$result = _$v ??
        new _$PecasRecord._(
            imagePeca: imagePeca,
            referenciaPeca: referenciaPeca,
            anoPeca: anoPeca,
            localizacaoPeca: localizacaoPeca,
            decricaoPeca: decricaoPeca,
            valorPeca: valorPeca,
            uuidProprietario: uuidProprietario,
            uid: uid,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compras_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ComprasRecord> _$comprasRecordSerializer =
    new _$ComprasRecordSerializer();

class _$ComprasRecordSerializer implements StructuredSerializer<ComprasRecord> {
  @override
  final Iterable<Type> types = const [ComprasRecord, _$ComprasRecord];
  @override
  final String wireName = 'ComprasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ComprasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uidComprador;
    if (value != null) {
      result
        ..add('uid_comprador')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uidVendedor;
    if (value != null) {
      result
        ..add('uid_vendedor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refPeca;
    if (value != null) {
      result
        ..add('ref_peca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mensagem;
    if (value != null) {
      result
        ..add('mensagem')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valorCompra;
    if (value != null) {
      result
        ..add('valor_compra')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  ComprasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ComprasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid_comprador':
          result.uidComprador = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid_vendedor':
          result.uidVendedor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ref_peca':
          result.refPeca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mensagem':
          result.mensagem = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valor_compra':
          result.valorCompra = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$ComprasRecord extends ComprasRecord {
  @override
  final String? uidComprador;
  @override
  final String? uidVendedor;
  @override
  final String? refPeca;
  @override
  final String? mensagem;
  @override
  final double? valorCompra;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ComprasRecord([void Function(ComprasRecordBuilder)? updates]) =>
      (new ComprasRecordBuilder()..update(updates))._build();

  _$ComprasRecord._(
      {this.uidComprador,
      this.uidVendedor,
      this.refPeca,
      this.mensagem,
      this.valorCompra,
      this.ffRef})
      : super._();

  @override
  ComprasRecord rebuild(void Function(ComprasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComprasRecordBuilder toBuilder() => new ComprasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComprasRecord &&
        uidComprador == other.uidComprador &&
        uidVendedor == other.uidVendedor &&
        refPeca == other.refPeca &&
        mensagem == other.mensagem &&
        valorCompra == other.valorCompra &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uidComprador.hashCode), uidVendedor.hashCode),
                    refPeca.hashCode),
                mensagem.hashCode),
            valorCompra.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ComprasRecord')
          ..add('uidComprador', uidComprador)
          ..add('uidVendedor', uidVendedor)
          ..add('refPeca', refPeca)
          ..add('mensagem', mensagem)
          ..add('valorCompra', valorCompra)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ComprasRecordBuilder
    implements Builder<ComprasRecord, ComprasRecordBuilder> {
  _$ComprasRecord? _$v;

  String? _uidComprador;
  String? get uidComprador => _$this._uidComprador;
  set uidComprador(String? uidComprador) => _$this._uidComprador = uidComprador;

  String? _uidVendedor;
  String? get uidVendedor => _$this._uidVendedor;
  set uidVendedor(String? uidVendedor) => _$this._uidVendedor = uidVendedor;

  String? _refPeca;
  String? get refPeca => _$this._refPeca;
  set refPeca(String? refPeca) => _$this._refPeca = refPeca;

  String? _mensagem;
  String? get mensagem => _$this._mensagem;
  set mensagem(String? mensagem) => _$this._mensagem = mensagem;

  double? _valorCompra;
  double? get valorCompra => _$this._valorCompra;
  set valorCompra(double? valorCompra) => _$this._valorCompra = valorCompra;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ComprasRecordBuilder() {
    ComprasRecord._initializeBuilder(this);
  }

  ComprasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uidComprador = $v.uidComprador;
      _uidVendedor = $v.uidVendedor;
      _refPeca = $v.refPeca;
      _mensagem = $v.mensagem;
      _valorCompra = $v.valorCompra;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComprasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ComprasRecord;
  }

  @override
  void update(void Function(ComprasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ComprasRecord build() => _build();

  _$ComprasRecord _build() {
    final _$result = _$v ??
        new _$ComprasRecord._(
            uidComprador: uidComprador,
            uidVendedor: uidVendedor,
            refPeca: refPeca,
            mensagem: mensagem,
            valorCompra: valorCompra,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

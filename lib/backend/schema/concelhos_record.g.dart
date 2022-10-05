// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concelhos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConcelhosRecord> _$concelhosRecordSerializer =
    new _$ConcelhosRecordSerializer();

class _$ConcelhosRecordSerializer
    implements StructuredSerializer<ConcelhosRecord> {
  @override
  final Iterable<Type> types = const [ConcelhosRecord, _$ConcelhosRecord];
  @override
  final String wireName = 'ConcelhosRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConcelhosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.concelho;
    if (value != null) {
      result
        ..add('concelho')
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
  ConcelhosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConcelhosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'concelho':
          result.concelho = serializers.deserialize(value,
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

class _$ConcelhosRecord extends ConcelhosRecord {
  @override
  final String? concelho;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConcelhosRecord([void Function(ConcelhosRecordBuilder)? updates]) =>
      (new ConcelhosRecordBuilder()..update(updates))._build();

  _$ConcelhosRecord._({this.concelho, this.ffRef}) : super._();

  @override
  ConcelhosRecord rebuild(void Function(ConcelhosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConcelhosRecordBuilder toBuilder() =>
      new ConcelhosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConcelhosRecord &&
        concelho == other.concelho &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, concelho.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConcelhosRecord')
          ..add('concelho', concelho)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConcelhosRecordBuilder
    implements Builder<ConcelhosRecord, ConcelhosRecordBuilder> {
  _$ConcelhosRecord? _$v;

  String? _concelho;
  String? get concelho => _$this._concelho;
  set concelho(String? concelho) => _$this._concelho = concelho;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConcelhosRecordBuilder() {
    ConcelhosRecord._initializeBuilder(this);
  }

  ConcelhosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _concelho = $v.concelho;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConcelhosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConcelhosRecord;
  }

  @override
  void update(void Function(ConcelhosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConcelhosRecord build() => _build();

  _$ConcelhosRecord _build() {
    final _$result =
        _$v ?? new _$ConcelhosRecord._(concelho: concelho, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

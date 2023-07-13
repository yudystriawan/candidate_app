// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CandidateBaseResponse<T> _$CandidateBaseResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _CandidateBaseResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$CandidateBaseResponse<T> {
  T? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CandidateBaseResponseCopyWith<T, CandidateBaseResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateBaseResponseCopyWith<T, $Res> {
  factory $CandidateBaseResponseCopyWith(CandidateBaseResponse<T> value,
          $Res Function(CandidateBaseResponse<T>) then) =
      _$CandidateBaseResponseCopyWithImpl<T, $Res, CandidateBaseResponse<T>>;
  @useResult
  $Res call({T? result});
}

/// @nodoc
class _$CandidateBaseResponseCopyWithImpl<T, $Res,
        $Val extends CandidateBaseResponse<T>>
    implements $CandidateBaseResponseCopyWith<T, $Res> {
  _$CandidateBaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CandidateBaseResponseCopyWith<T, $Res>
    implements $CandidateBaseResponseCopyWith<T, $Res> {
  factory _$$_CandidateBaseResponseCopyWith(_$_CandidateBaseResponse<T> value,
          $Res Function(_$_CandidateBaseResponse<T>) then) =
      __$$_CandidateBaseResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? result});
}

/// @nodoc
class __$$_CandidateBaseResponseCopyWithImpl<T, $Res>
    extends _$CandidateBaseResponseCopyWithImpl<T, $Res,
        _$_CandidateBaseResponse<T>>
    implements _$$_CandidateBaseResponseCopyWith<T, $Res> {
  __$$_CandidateBaseResponseCopyWithImpl(_$_CandidateBaseResponse<T> _value,
      $Res Function(_$_CandidateBaseResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_CandidateBaseResponse<T>(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_CandidateBaseResponse<T> implements _CandidateBaseResponse<T> {
  const _$_CandidateBaseResponse({this.result});

  factory _$_CandidateBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_CandidateBaseResponseFromJson(json, fromJsonT);

  @override
  final T? result;

  @override
  String toString() {
    return 'CandidateBaseResponse<$T>(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CandidateBaseResponse<T> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CandidateBaseResponseCopyWith<T, _$_CandidateBaseResponse<T>>
      get copyWith => __$$_CandidateBaseResponseCopyWithImpl<T,
          _$_CandidateBaseResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_CandidateBaseResponseToJson<T>(this, toJsonT);
  }
}

abstract class _CandidateBaseResponse<T> implements CandidateBaseResponse<T> {
  const factory _CandidateBaseResponse({final T? result}) =
      _$_CandidateBaseResponse<T>;

  factory _CandidateBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_CandidateBaseResponse<T>.fromJson;

  @override
  T? get result;
  @override
  @JsonKey(ignore: true)
  _$$_CandidateBaseResponseCopyWith<T, _$_CandidateBaseResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}

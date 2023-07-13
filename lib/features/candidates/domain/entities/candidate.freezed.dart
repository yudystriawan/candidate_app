// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Candidate {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  int get birthday => throw _privateConstructorUsedError;
  int get expired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandidateCopyWith<Candidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateCopyWith<$Res> {
  factory $CandidateCopyWith(Candidate value, $Res Function(Candidate) then) =
      _$CandidateCopyWithImpl<$Res, Candidate>;
  @useResult
  $Res call({int id, String name, String photoUrl, int birthday, int expired});
}

/// @nodoc
class _$CandidateCopyWithImpl<$Res, $Val extends Candidate>
    implements $CandidateCopyWith<$Res> {
  _$CandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? birthday = null,
    Object? expired = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as int,
      expired: null == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CandidateCopyWith<$Res> implements $CandidateCopyWith<$Res> {
  factory _$$_CandidateCopyWith(
          _$_Candidate value, $Res Function(_$_Candidate) then) =
      __$$_CandidateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String photoUrl, int birthday, int expired});
}

/// @nodoc
class __$$_CandidateCopyWithImpl<$Res>
    extends _$CandidateCopyWithImpl<$Res, _$_Candidate>
    implements _$$_CandidateCopyWith<$Res> {
  __$$_CandidateCopyWithImpl(
      _$_Candidate _value, $Res Function(_$_Candidate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? birthday = null,
    Object? expired = null,
  }) {
    return _then(_$_Candidate(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as int,
      expired: null == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Candidate extends _Candidate {
  const _$_Candidate(
      {required this.id,
      required this.name,
      required this.photoUrl,
      required this.birthday,
      required this.expired})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final int birthday;
  @override
  final int expired;

  @override
  String toString() {
    return 'Candidate(id: $id, name: $name, photoUrl: $photoUrl, birthday: $birthday, expired: $expired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Candidate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.expired, expired) || other.expired == expired));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, photoUrl, birthday, expired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CandidateCopyWith<_$_Candidate> get copyWith =>
      __$$_CandidateCopyWithImpl<_$_Candidate>(this, _$identity);
}

abstract class _Candidate extends Candidate {
  const factory _Candidate(
      {required final int id,
      required final String name,
      required final String photoUrl,
      required final int birthday,
      required final int expired}) = _$_Candidate;
  const _Candidate._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  int get birthday;
  @override
  int get expired;
  @override
  @JsonKey(ignore: true)
  _$$_CandidateCopyWith<_$_Candidate> get copyWith =>
      throw _privateConstructorUsedError;
}

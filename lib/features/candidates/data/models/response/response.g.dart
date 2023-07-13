// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CandidateBaseResponse<T> _$$_CandidateBaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_CandidateBaseResponse<T>(
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
    );

Map<String, dynamic> _$$_CandidateBaseResponseToJson<T>(
  _$_CandidateBaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'result': _$nullableGenericToJson(instance.result, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

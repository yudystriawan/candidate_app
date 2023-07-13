// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CandidateDto _$$_CandidateDtoFromJson(Map<String, dynamic> json) =>
    _$_CandidateDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      photoUrl: json['photo'] as String?,
      birthday: json['birthday'] as int?,
      expired: json['expired'] as int?,
    );

Map<String, dynamic> _$$_CandidateDtoToJson(_$_CandidateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photoUrl,
      'birthday': instance.birthday,
      'expired': instance.expired,
    };

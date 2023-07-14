part of '../model.dart';

@freezed
class StatusDto with _$StatusDto {
  const StatusDto._();
  const factory StatusDto({
    int? id,
    String? status,
    String? jobTitle,
    String? companyName,
    String? industry,
  }) = _StatusDto;

  factory StatusDto.fromJson(Map<String, dynamic> json) =>
      _$StatusDtoFromJson(json);

  Status toDomain() {
    return Status(
      id: id ?? 0,
      status: status ?? '',
      jobTitle: jobTitle ?? '',
      companyName: companyName ?? '',
      industry: industry ?? '',
    );
  }
}

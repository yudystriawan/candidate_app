part of '../model.dart';

@freezed
class EmailDto with _$EmailDto {
  const EmailDto._();
  const factory EmailDto({
    int? id,
    String? email,
    String? phone,
  }) = _EmailDto;

  factory EmailDto.fromJson(Map<String, dynamic> json) =>
      _$EmailDtoFromJson(json);

  Email toDomain() {
    return Email(
      id: id ?? 0,
      email: email ?? '',
      phone: phone ?? '',
    );
  }
}

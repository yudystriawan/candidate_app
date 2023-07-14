part of '../model.dart';

@freezed
class AddressDto with _$AddressDto {
  const AddressDto._();
  const factory AddressDto({
    int? id,
    String? address,
    String? city,
    String? state,
    int? zipCode,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  Address toDomain() {
    return Address(
      id: id ?? 0,
      address: address ?? '',
      city: city ?? '',
      state: state ?? '',
      zipCode: zipCode ?? 0,
    );
  }
}

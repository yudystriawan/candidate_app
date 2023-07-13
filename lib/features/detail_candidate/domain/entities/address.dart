part of 'entity.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required int id,
    required String address,
    required String city,
    required String state,
    required int zipCode,
  }) = _Address;
}

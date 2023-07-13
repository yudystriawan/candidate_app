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

  factory Address.empty() => const Address(
        id: 0,
        address: '',
        city: '',
        state: '',
        zipCode: 0,
      );
}

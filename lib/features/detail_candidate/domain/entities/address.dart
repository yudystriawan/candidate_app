part of 'entity.dart';

@freezed
class Address with _$Address {
  const Address._();
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

  String get formattedAddress {
    String formattedAddress = '';
    if (address.isNotEmpty) formattedAddress += address;
    if (city.isNotEmpty) formattedAddress += ', $city';
    if (state.isNotEmpty) formattedAddress += ', $state';
    if (zipCode != 0) formattedAddress += ', $zipCode';

    return formattedAddress;
  }

  bool get isEmpty => this == Address.empty();
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true)
class AddressBaseResponse<T> with _$AddressBaseResponse<T> {
  const factory AddressBaseResponse({
    T? results,
  }) = _AddressBaseResponse<T>;

  factory AddressBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$AddressBaseResponseFromJson(json, fromJsonT);
}

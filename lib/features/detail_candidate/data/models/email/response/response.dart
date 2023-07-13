import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true)
class EmailBaseResponse<T> with _$EmailBaseResponse<T> {
  const factory EmailBaseResponse({
    T? results,
  }) = _EmailBaseResponse<T>;

  factory EmailBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$EmailBaseResponseFromJson(json, fromJsonT);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true)
class StatusBaseResponse<T> with _$StatusBaseResponse<T> {
  const factory StatusBaseResponse({
    T? results,
  }) = _StatusBaseResponse<T>;

  factory StatusBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$StatusBaseResponseFromJson(json, fromJsonT);
}

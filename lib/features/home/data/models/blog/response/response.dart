import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true)
class BlogBaseResponse<T> with _$BlogBaseResponse<T> {
  const factory BlogBaseResponse({
    T? results,
  }) = _BlogBaseResponse<T>;

  factory BlogBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BlogBaseResponseFromJson(json, fromJsonT);
}

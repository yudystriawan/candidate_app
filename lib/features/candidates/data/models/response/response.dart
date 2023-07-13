import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true)
class CandidateBaseResponse<T> with _$CandidateBaseResponse<T> {
  const factory CandidateBaseResponse({
    T? result,
  }) = _CandidateBaseResponse<T>;

  factory CandidateBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$CandidateBaseResponseFromJson(json, fromJsonT);
}

part of 'model.dart';

@freezed
class CandidateDto with _$CandidateDto {
  const CandidateDto._();
  const factory CandidateDto({
    int? id,
    String? name,
    @JsonKey(name: 'photo') String? photoUrl,
    int? birthday,
    int? expired,
  }) = _CandidateDto;

  factory CandidateDto.fromJson(Map<String, dynamic> json) =>
      _$CandidateDtoFromJson(json);
}

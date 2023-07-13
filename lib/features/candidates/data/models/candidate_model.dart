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

  Candidate toDomain() {
    return Candidate(
      id: id ?? 0,
      name: name ?? '',
      photoUrl: photoUrl ?? '',
      birthday: birthday ?? 0,
      expired: expired ?? 0,
    );
  }
}

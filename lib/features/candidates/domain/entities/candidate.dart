import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate.freezed.dart';

@freezed
class Candidate with _$Candidate {
  const Candidate._();
  const factory Candidate({
    required int id,
    required String name,
    required String photoUrl,
    required int birthday,
    required int expired,
  }) = _Candidate;

  factory Candidate.empty() {
    return const Candidate(
      id: 0,
      name: '',
      photoUrl: '',
      birthday: 0,
      expired: 0,
    );
  }
}

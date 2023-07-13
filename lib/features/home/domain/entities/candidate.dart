part of 'entity.dart';

@freezed
class Candidate with _$Candidate {
  const Candidate._();
  const factory Candidate({
    required int id,
    required String name,
    required String gender,
    required String photoUrl,
    required int birthday,
    required int expired,
  }) = _Candidate;

  factory Candidate.empty() {
    return const Candidate(
      id: 0,
      name: '',
      gender: '',
      photoUrl: '',
      birthday: 0,
      expired: 0,
    );
  }

  bool get isExpired {
    final expiredDate = DateTime.fromMillisecondsSinceEpoch(expired);
    final currentDate = DateTime.now();
    if (currentDate.isAfter(expiredDate)) {
      return true;
    }

    return false;
  }
}

extension IntX on int {
  String toDateFormat([String? format]) {
    final date = DateTime.fromMillisecondsSinceEpoch(toInt());
    final formatter = DateFormat(format ?? 'yyyy-MM-dd');
    return formatter.format(date);
  }
}

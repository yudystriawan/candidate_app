part of 'entity.dart';

@freezed
class Status with _$Status {
  const factory Status({
    required int id,
    required String status,
    required String jobTitle,
    required String companyName,
    required String industry,
  }) = _Status;

  factory Status.empty() => const Status(
        id: 0,
        status: '',
        jobTitle: '',
        companyName: '',
        industry: '',
      );
}

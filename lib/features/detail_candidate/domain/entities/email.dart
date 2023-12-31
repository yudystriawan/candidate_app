part of 'entity.dart';

@freezed
class Email with _$Email {
  const factory Email({
    required int id,
    required String email,
    required String phone,
  }) = _Email;

  factory Email.empty() => const Email(
        id: 0,
        email: '',
        phone: '',
      );
}

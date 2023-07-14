import 'package:candidate_app/features/detail_candidate/domain/usecases/clean_phone_number.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final sut = CleanPhoneNumber();

  test('should remove dashes and spaces', () async {
    const phoneNumber = '+6281-23 34- 42 23';
    const expectedPhoneNumber = '+628123344223';

    final result = await sut(const Params(phoneNumber: phoneNumber));

    expect(result, equals(const Right(expectedPhoneNumber)));
  });

  test('should return same phone number when no dashes and spaces', () async {
    const phoneNumber = '+628123344223';

    final result = await sut(const Params(phoneNumber: phoneNumber));

    expect(result, equals(const Right(phoneNumber)));
  });
}

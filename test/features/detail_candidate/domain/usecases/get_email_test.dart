import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/email_repository.dart';
import 'package:candidate_app/features/detail_candidate/domain/usecases/get_email.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_email_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EmailRepository>()])
void main() {
  final mockRepository = MockEmailRepository();
  final sut = GetEmail(mockRepository);

  const id = 1;
  const email = Email(
    id: 1,
    email: 'test@example.com',
    phone: '+628123456789',
  );

  void setupMockSuccessResponse() {
    when(mockRepository.getEmail(id)).thenAnswer(
      (realInvocation) async => right(email),
    );
  }

  void setupMockFailureResponse() {
    when(mockRepository.getEmail(id)).thenAnswer(
      (realInvocation) async => left(const Failure.unexpectedError()),
    );
  }

  test('should get an email', () async {
    setupMockSuccessResponse();

    final result = await sut(const Params(id));

    expect(result, const Right(email));
    verify(mockRepository.getEmail(id));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when get email fails', () async {
    setupMockFailureResponse();

    final result = await sut(const Params(id));

    expect(result.isLeft(), true);
    verify(mockRepository.getEmail(id));
    verifyNoMoreInteractions(mockRepository);
  });
}

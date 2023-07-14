import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/launcher_repository.dart';
import 'package:candidate_app/features/detail_candidate/domain/usecases/launch_whatsapp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'launch_email_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LauncherRepository>()])
void main() {
  final mockRepository = MockLauncherRepository();
  final sut = LaunchWhatsapp(mockRepository);

  const phoneNumber = '+62123456789';
  const prefixMessage = 'Hello';
  const message = 'I am new';
  const params = Params(
    phoneNumber: phoneNumber,
    prefixMessage: prefixMessage,
    contentMessage: message,
  );

  void setupMockSuccessResponse() {
    when(mockRepository.launchWhatsappApp(
      phoneNumber: phoneNumber,
      prefixMessage: prefixMessage,
      message: message,
    )).thenAnswer(
      (realInvocation) async => right(unit),
    );
  }

  void setupMockFailureResponse() {
    when(mockRepository.launchWhatsappApp(
      phoneNumber: phoneNumber,
      prefixMessage: prefixMessage,
      message: message,
    )).thenAnswer(
      (realInvocation) async => left(const Failure.unexpectedError()),
    );
  }

  test('should launch whatsapp with provided parameter', () async {
    setupMockSuccessResponse();

    final result = await sut(params);

    expect(result, const Right(unit));
    verify(mockRepository.launchWhatsappApp(
      phoneNumber: phoneNumber,
      prefixMessage: prefixMessage,
      message: message,
    ));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when get status fails', () async {
    setupMockFailureResponse();

    final result = await sut(params);

    expect(result.isLeft(), true);
    verify(mockRepository.launchWhatsappApp(
      phoneNumber: phoneNumber,
      prefixMessage: prefixMessage,
      message: message,
    ));
    verifyNoMoreInteractions(mockRepository);
  });
}

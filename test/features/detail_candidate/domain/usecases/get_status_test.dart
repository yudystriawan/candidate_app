import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/status_repository.dart';
import 'package:candidate_app/features/detail_candidate/domain/usecases/get_status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_status_test.mocks.dart';

@GenerateNiceMocks([MockSpec<StatusRepository>()])
void main() {
  final mockRepository = MockStatusRepository();
  final sut = GetStatus(mockRepository);

  const id = 1;
  const status = Status(
    id: 1,
    status: 'Hired',
    jobTitle: 'Sales',
    companyName: 'tya',
    industry: 'Design',
  );

  void setupMockSuccessResponse() {
    when(mockRepository.getStatus(id)).thenAnswer(
      (realInvocation) async => right(status),
    );
  }

  void setupMockFailureResponse() {
    when(mockRepository.getStatus(id)).thenAnswer(
      (realInvocation) async => left(const Failure.unexpectedError()),
    );
  }

  test('should get an status', () async {
    setupMockSuccessResponse();

    final result = await sut(const Params(id));

    expect(result, const Right(status));
    verify(mockRepository.getStatus(id));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when get status fails', () async {
    setupMockFailureResponse();

    final result = await sut(const Params(id));

    expect(result.isLeft(), true);
    verify(mockRepository.getStatus(id));
    verifyNoMoreInteractions(mockRepository);
  });
}

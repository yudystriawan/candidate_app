import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:candidate_app/features/home/domain/repositories/candidate_repository.dart';
import 'package:candidate_app/features/home/domain/usecases/get_candidates.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_candidates_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CandidateRepository>()])
void main() {
  final mockRepository = MockCandidateRepository();
  final sut = GetCandidates(mockRepository);

  final candidates = KtList.from([
    Candidate(
      id: 1,
      name: 'test name',
      gender: 'test gender',
      photoUrl: 'https://photoUrl',
      birthday: DateTime.now().millisecondsSinceEpoch,
      expired: DateTime.now().millisecondsSinceEpoch,
    ),
    Candidate(
      id: 2,
      name: 'test name',
      gender: 'test gender',
      photoUrl: 'https://photoUrl',
      birthday: DateTime.now().millisecondsSinceEpoch,
      expired: DateTime.now().millisecondsSinceEpoch,
    ),
    Candidate(
      id: 2,
      name: 'hohohoho',
      gender: 'test gender',
      photoUrl: 'https://photoUrl',
      birthday: DateTime.now().millisecondsSinceEpoch,
      expired: DateTime.now().millisecondsSinceEpoch,
    ),
  ]);

  void setupMockSuccessResponse(String? query) {
    when(mockRepository.getCandidates(query: query)).thenAnswer(
      (realInvocation) async {
        if (query != null && query.isNotEmpty) {
          final filteredBlogs = candidates
              .filter(
                  (candidate) => candidate.name.toLowerCase().contains(query))
              .toList();
          return right(filteredBlogs);
        }

        return right(candidates);
      },
    );
  }

  void setupMockFailureResponse(String? query) {
    when(mockRepository.getCandidates(query: query)).thenAnswer(
      (realInvocation) async => left(const Failure.unexpectedError()),
    );
  }

  test('should get candidates', () async {
    const query = null;
    setupMockSuccessResponse(query);

    final result = await sut(const Params(query));

    expect(result, Right(candidates));
    verify(mockRepository.getCandidates(query: query));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should get candidates that have query in title', () async {
    const query = 's';
    final expectedBlogs = candidates
        .filter((blog) => blog.name.toLowerCase().contains(query))
        .toList();

    setupMockSuccessResponse(query);

    final result = await sut(const Params(query));

    expect(result, Right(expectedBlogs));
    verify(mockRepository.getCandidates(query: query));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when get status fails', () async {
    setupMockFailureResponse(null);

    final result = await sut(const Params(null));

    expect(result.isLeft(), true);
    verify(mockRepository.getCandidates());
    verifyNoMoreInteractions(mockRepository);
  });
}

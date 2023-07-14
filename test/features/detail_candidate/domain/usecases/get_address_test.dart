import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/address_repository.dart';
import 'package:candidate_app/features/detail_candidate/domain/usecases/get_address.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_address_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AddressRepository>()])
void main() {
  final mockRepository = MockAddressRepository();
  final sut = GetAddress(mockRepository);

  const id = 1;
  const address = Address(
    id: 1,
    address: 'Jl. jalan',
    city: 'Jakarta',
    state: 'DKI Jakarta',
    zipCode: 80000,
  );

  void setupMockSuccessResponse() {
    when(mockRepository.getAddress(id)).thenAnswer(
      (realInvocation) async => right(address),
    );
  }

  void setupMockFailureResponse() {
    when(mockRepository.getAddress(id)).thenAnswer(
      (realInvocation) async => left(const Failure.unexpectedError()),
    );
  }

  test('should get an address', () async {
    setupMockSuccessResponse();

    final result = await sut(const Params(id));

    expect(result, const Right(address));
    verify(mockRepository.getAddress(id));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when get address fails', () async {
    setupMockFailureResponse();

    final result = await sut(const Params(id));

    expect(result.isLeft(), true);
    verify(mockRepository.getAddress(id));
    verifyNoMoreInteractions(mockRepository);
  });
}

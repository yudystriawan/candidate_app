part of 'detail_candidate_loader_bloc.dart';

@freezed
class DetailCandidateLoaderState with _$DetailCandidateLoaderState {
  const factory DetailCandidateLoaderState({
    required Address address,
    required Email contact,
    required Status experience,
    @Default(false) bool isLoading,
    Failure? failure,
  }) = _DetailCandidateLoaderState;

  factory DetailCandidateLoaderState.initial() {
    return DetailCandidateLoaderState(
      address: Address.empty(),
      contact: Email.empty(),
      experience: Status.empty(),
    );
  }
}

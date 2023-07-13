part of 'home_loader_bloc.dart';

@freezed
class HomeLoaderState with _$HomeLoaderState {
  const factory HomeLoaderState({
    @Default(false) bool isLoading,
    Failure? failure,
    required KtList<Candidate> candidates,
  }) = _HomeLoaderState;

  factory HomeLoaderState.initial() => const HomeLoaderState(
        candidates: KtList.empty(),
      );
}

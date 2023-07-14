part of 'home_loader_bloc.dart';

@freezed
class HomeLoaderEvent with _$HomeLoaderEvent {
  const factory HomeLoaderEvent.fetched() = _Fetched;
  const factory HomeLoaderEvent.queryChanged(String query) = _QueryChanged;
  const factory HomeLoaderEvent.queryCleared() = _QueryCleared;
}

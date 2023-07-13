part of 'home_loader_bloc.dart';

@freezed
class HomeLoaderEvent with _$HomeLoaderEvent {
  const factory HomeLoaderEvent.fetched() = _Fetched;
  const factory HomeLoaderEvent.searched(String query) = _Searched;
}

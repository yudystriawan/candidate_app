part of 'launch_actor_bloc.dart';

@freezed
class LaunchActorState with _$LaunchActorState {
  const factory LaunchActorState.initial() = _Initial;
  const factory LaunchActorState.loadInProgress() = _LoadInProgress;
  const factory LaunchActorState.loadFailure(Failure failure) = _LoadFailure;
  const factory LaunchActorState.loadSuccess() = _LoadSuccess;
}

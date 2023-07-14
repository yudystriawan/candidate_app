part of 'launch_actor_bloc.dart';

@freezed
class LaunchActorEvent with _$LaunchActorEvent {
  const factory LaunchActorEvent.whatsappLaunched({
    required String phoneNumber,
    String? prefixMessage,
    String? message,
  }) = _WhatsappLaunched;
  const factory LaunchActorEvent.emailLaunched({
    required String email,
    String? prefixMessage,
    String? message,
  }) = _EmailLaunched;
}

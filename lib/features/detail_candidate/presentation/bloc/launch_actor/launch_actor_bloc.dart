// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:candidate_app/features/detail_candidate/domain/usecases/clean_phone_number.dart';
import 'package:candidate_app/features/detail_candidate/domain/usecases/launch_email.dart'
    as e;
import 'package:candidate_app/features/detail_candidate/domain/usecases/launch_whatsapp.dart'
    as w;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';

part 'launch_actor_bloc.freezed.dart';
part 'launch_actor_event.dart';
part 'launch_actor_state.dart';

@injectable
class LaunchActorBloc extends Bloc<LaunchActorEvent, LaunchActorState> {
  final e.LaunchEmail _launchEmail;
  final w.LaunchWhatsapp _launchWhatsapp;
  final CleanPhoneNumber _cleanPhoneNumber;

  LaunchActorBloc(
    this._launchEmail,
    this._launchWhatsapp,
    this._cleanPhoneNumber,
  ) : super(const LaunchActorState.initial()) {
    on<_EmailLaunched>(_onEmailLaunched);
    on<_WhatsappLaunched>(_onWhatsappLaunched);
  }

  void _onEmailLaunched(
    _EmailLaunched event,
    Emitter<LaunchActorState> emit,
  ) async {
    emit(const LaunchActorState.loadInProgress());

    final failureOrSuccess = await _launchEmail(e.Params(
      email: event.email,
      prefixMessage: event.prefixMessage,
      contentMessage: event.message,
    ));

    emit(failureOrSuccess.fold(
      (f) => LaunchActorState.loadFailure(f),
      (_) => const LaunchActorState.loadSuccess(),
    ));
  }

  void _onWhatsappLaunched(
    _WhatsappLaunched event,
    Emitter<LaunchActorState> emit,
  ) async {
    emit(const LaunchActorState.loadInProgress());

    final failureOrPhoneNumber =
        await _cleanPhoneNumber(Params(phoneNumber: event.phoneNumber));

    emit(await failureOrPhoneNumber.fold(
      (f) async => LaunchActorState.loadFailure(f),
      (phoneNumber) async {
        final failureOrSuccess = await _launchWhatsapp(w.Params(
          phoneNumber: phoneNumber,
          prefixMessage: event.prefixMessage,
          contentMessage: event.message,
        ));

        return failureOrSuccess.fold(
          (f) => LaunchActorState.loadFailure(f),
          (_) => const LaunchActorState.loadSuccess(),
        );
      },
    ));
  }
}

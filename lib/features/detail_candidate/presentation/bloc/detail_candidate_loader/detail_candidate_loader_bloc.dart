// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/entity.dart';
import '../../../domain/usecases/get_address.dart' as a;
import '../../../domain/usecases/get_email.dart' as c;
import '../../../domain/usecases/get_status.dart' as e;

part 'detail_candidate_loader_bloc.freezed.dart';
part 'detail_candidate_loader_event.dart';
part 'detail_candidate_loader_state.dart';

@injectable
class DetailCandidateLoaderBloc
    extends Bloc<DetailCandidateLoaderEvent, DetailCandidateLoaderState> {
  final a.GetAddress _getAddress;
  final c.GetEmail _getContact;
  final e.GetStatus _getExperience;

  DetailCandidateLoaderBloc(
    this._getAddress,
    this._getContact,
    this._getExperience,
  ) : super(DetailCandidateLoaderState.initial()) {
    on<DetailCandidateLoaderEvent>((event, emit) async {
      late Address address;
      late Email contact;
      late Status experience;

      final id = event.id;

      DetailCandidateLoaderState newState = state.copyWith(isLoading: true);
      emit(newState);

      // get address
      final failureOrAddress = await _getAddress(a.Params(id));

      newState = newState.copyWith(isLoading: false);

      if (failureOrAddress.isLeft()) {
        emit(newState.copyWith(
          failure: failureOrAddress
              .swap()
              .getOrElse(() => const Failure.unexpectedError()),
        ));
        return;
      }

      address = failureOrAddress.getOrElse(() => Address.empty());

      // get contact
      final failureOrContact = await _getContact(c.Params(id));

      newState = newState.copyWith(isLoading: false);

      if (failureOrContact.isLeft()) {
        emit(newState.copyWith(
          failure: failureOrContact
              .swap()
              .getOrElse(() => const Failure.unexpectedError()),
        ));
        return;
      }

      contact = failureOrContact.getOrElse(() => Email.empty());

      // get contact
      final failureOrExperience = await _getExperience(e.Params(id));

      newState = newState.copyWith(isLoading: false);

      if (failureOrExperience.isLeft()) {
        emit(newState.copyWith(
          failure: failureOrExperience
              .swap()
              .getOrElse(() => const Failure.unexpectedError()),
        ));
        return;
      }

      experience = failureOrExperience.getOrElse(() => Status.empty());

      emit(newState.copyWith(
        address: address,
        contact: contact,
        experience: experience,
      ));
    });
  }
}

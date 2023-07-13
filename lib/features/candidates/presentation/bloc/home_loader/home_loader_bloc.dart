import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import 'package:candidate_app/features/candidates/domain/usecases/get_candidates.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/candidate.dart';

part 'home_loader_bloc.freezed.dart';
part 'home_loader_event.dart';
part 'home_loader_state.dart';

@injectable
class HomeLoaderBloc extends Bloc<HomeLoaderEvent, HomeLoaderState> {
  final GetCandidates _getCandidates;

  HomeLoaderBloc(
    this._getCandidates,
  ) : super(HomeLoaderState.initial()) {
    on<_Fetched>(_onFetched);
  }

  void _onFetched(
    _Fetched event,
    Emitter<HomeLoaderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getCandidates(const Params(null));

    emit(result.fold(
      (f) => state.copyWith(
        isLoading: false,
        failure: f,
      ),
      (candidates) => state.copyWith(
        isLoading: false,
        candidates: candidates,
      ),
    ));
  }
}

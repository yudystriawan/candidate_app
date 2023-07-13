// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/get_blogs.dart' as blog;
import '../../../domain/usecases/get_candidates.dart' as candidate;

part 'home_loader_bloc.freezed.dart';
part 'home_loader_event.dart';
part 'home_loader_state.dart';

@injectable
class HomeLoaderBloc extends Bloc<HomeLoaderEvent, HomeLoaderState> {
  final candidate.GetCandidates _getCandidates;
  final blog.GetBlogs _getBlogs;

  HomeLoaderBloc(
    this._getCandidates,
    this._getBlogs,
  ) : super(HomeLoaderState.initial()) {
    on<_Fetched>(_onFetched);
  }

  void _onFetched(
    _Fetched event,
    Emitter<HomeLoaderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // get candidates data
    final failureOrCandidates = await _getCandidates(
      const candidate.Params(null),
    );

    // get blogs data
    final failureOrBlogs = await _getBlogs(const blog.Params(null));

    final newState = state.copyWith(isLoading: false);

    // while get candidates has error, return the failure
    if (failureOrCandidates.isLeft()) {
      emit(newState.copyWith(
        failure: failureOrCandidates
            .swap()
            .getOrElse(() => const Failure.unexpectedError()),
      ));
      return;
    }

    // while get blogs has error, return the failure
    if (failureOrBlogs.isLeft()) {
      emit(newState.copyWith(
        failure: failureOrCandidates
            .swap()
            .getOrElse(() => const Failure.unexpectedError()),
      ));
      return;
    }

    final candidates =
        failureOrCandidates.getOrElse(() => const KtList.empty());
    final blogs = failureOrBlogs.getOrElse(() => const KtList.empty());

    // combine the data
    final KtMutableList<Object> data = KtMutableList.empty();
    data.addAll(candidates);
    data.addAll(blogs);
    data.shuffle();

    emit(newState.copyWith(
      failure: null,
      data: data,
    ));
  }
}

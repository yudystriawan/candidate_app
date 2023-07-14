// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:async/async.dart';
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

  CancelableOperation<void>? _cancelableOperation;

  HomeLoaderBloc(
    this._getCandidates,
    this._getBlogs,
  ) : super(HomeLoaderState.initial()) {
    on<_Fetched>(_onFetched);
    on<_QueryChanged>(_onQueryChanged);
  }

  void _searchStarted() {
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(const Duration(milliseconds: 800)),
      onCancel: () {},
    );
  }

  void _onFetched(
    _Fetched event,
    Emitter<HomeLoaderState> emit,
  ) async {
    final query = event.query;

    emit(state.copyWith(isLoading: true));

    // get candidates data
    final failureOrCandidates = await _getCandidates(candidate.Params(query));

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

    // get blogs data
    final failureOrBlogs = await _getBlogs(blog.Params(query));

    // while get blogs has error, return the failure
    if (failureOrBlogs.isLeft()) {
      emit(newState.copyWith(
        failure: failureOrBlogs
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
    data.shuffle(Random());

    emit(newState.copyWith(
      failure: null,
      data: data,
    ));
  }

  void _onQueryChanged(
    _QueryChanged event,
    Emitter<HomeLoaderState> emit,
  ) async {
    final query = event.query;

    final isChanged = query != state.query;

    if (isChanged) {
      emit(state.copyWith(query: query));

      _cancelableOperation?.cancel();
      _searchStarted();

      _cancelableOperation?.value
          .whenComplete(() => add(HomeLoaderEvent.fetched(query)));
    }
  }
}

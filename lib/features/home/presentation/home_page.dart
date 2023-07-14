import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:candidate_app/features/home/presentation/widgets/blog_item_widget.dart';
import 'package:candidate_app/features/home/presentation/widgets/candidate_item_widget.dart';
import 'package:candidate_app/features/home/presentation/widgets/home_failure_widget.dart';
import 'package:candidate_app/injection.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt_dart/collection.dart';

import 'bloc/home_loader/home_loader_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLoaderBloc, HomeLoaderState>(
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (context, state) {
        final data = state.data;
        final hasError = state.failure != null;

        return Scaffold(
          appBar: EasySearchBar(
            title: const Text('Home'),
            foregroundColor: Colors.white,
            onSearch: (value) => context
                .read<HomeLoaderBloc>()
                .add(HomeLoaderEvent.queryChanged(value)),
          ),
          body: state.isLoading
              ? const LinearProgressIndicator()
              : hasError
                  ? HomeFailureWidget(failure: state.failure!)
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (data.isEmpty() && !state.isLoading)
                            const Expanded(
                              child: Center(
                                child: Text('No data.'),
                              ),
                            ),
                          if (data.isNotEmpty())
                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  context
                                      .read<HomeLoaderBloc>()
                                      .add(const HomeLoaderEvent.fetched());
                                },
                                child: ListView.separated(
                                  itemCount: data.size,
                                  padding: const EdgeInsets.all(8),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(height: 8.w);
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final isCandidate =
                                        data[index] is Candidate;
                                    final isBlog = data[index] is Blog;

                                    if (isCandidate) {
                                      return CandidateItemWidget(
                                        candidate: data[index] as Candidate,
                                      );
                                    }

                                    if (isBlog) {
                                      return BlogItemWidget(
                                          blog: data[index] as Blog);
                                    }

                                    return const SizedBox();
                                  },
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) =>
            getIt<HomeLoaderBloc>()..add(const HomeLoaderEvent.fetched()),
        child: this,
      );
}

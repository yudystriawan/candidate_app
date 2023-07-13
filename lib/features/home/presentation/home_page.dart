import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:candidate_app/features/home/presentation/widgets/blog_item_widget.dart';
import 'package:candidate_app/features/home/presentation/widgets/candidate_item_widget.dart';
import 'package:candidate_app/features/home/presentation/widgets/home_failure_widget.dart';
import 'package:candidate_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_loader/home_loader_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomeLoaderBloc>()..add(const HomeLoaderEvent.fetched()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocBuilder<HomeLoaderBloc, HomeLoaderState>(
          buildWhen: (p, c) => p.isLoading != c.isLoading,
          builder: (context, state) {
            final data = state.data;
            final hasError = state.failure != null;

            if (hasError) {
              return HomeFailureWidget(failure: state.failure!);
            }

            return Column(
              children: [
                if (state.isLoading) const LinearProgressIndicator(),
                if (data.isEmpty() && !state.isLoading)
                  const Center(child: Text('No data.')),
                Expanded(
                  child: ListView.separated(
                    itemCount: data.size,
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final isCandidate = data[index] is Candidate;
                      final isBlog = data[index] is Blog;

                      if (isCandidate) {
                        return CandidateItemWidget(
                          candidate: data[index] as Candidate,
                        );
                      }

                      if (isBlog) {
                        return BlogItemWidget(blog: data[index] as Blog);
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
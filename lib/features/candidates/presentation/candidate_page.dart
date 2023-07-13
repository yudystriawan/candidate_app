import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/features/candidates/presentation/bloc/home_loader/home_loader_bloc.dart';
import 'package:candidate_app/features/candidates/presentation/widgets/home_failure_widget.dart';
import 'package:candidate_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CandidatePage extends StatelessWidget {
  const CandidatePage({super.key});

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
            final candidates = state.candidates;
            final hasError = state.failure != null;

            if (hasError) {
              return HomeFailureWidget(failure: state.failure!);
            }

            if(candidates.isEmpty()){
              return const Center(child: Text('No data.'),);
            }

            return Column(
              children: [
                if (state.isLoading) const LinearProgressIndicator(),
                Expanded(
                    child: ListView.separated(
                  itemCount: candidates.size,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final candidate = candidates[index];
                    return Card(
                      child: Column(
                        children: [
                          Text(candidate.name),
                        ],
                      ),
                    );
                  },
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}

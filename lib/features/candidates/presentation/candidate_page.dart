import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/features/candidates/domain/entities/candidate.dart';
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

            return Column(
              children: [
                if (state.isLoading) const LinearProgressIndicator(),
                if (candidates.isEmpty() && !state.isLoading)
                  const Center(child: Text('No data.')),
                Expanded(
                  child: ListView.separated(
                    itemCount: candidates.size,
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final candidate = candidates[index];
                      return Card(
                        child: Container(
                          height: 120,
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 82,
                                height: 82,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(candidate.photoUrl),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _getName(candidate),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.cake,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                candidate.birthday
                                                    .toDateFormat(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Expired at: ${candidate.expired.toDateFormat()}',
                                          )
                                        ],
                                      ),
                                    ),
                                    if (candidate.isExpired)
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Text(
                                            'Expired',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
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

  String _getName(Candidate candidate) {
    String name = '';
    switch (candidate.gender) {
      case 'm':
        name += 'Mr. ';
        break;
      case 'f':
        name += 'Mrs. ';
        break;
      default:
    }
    name += candidate.name;
    return name;
  }
}

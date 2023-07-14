import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/candidate_address_widget.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/candidate_contact_widget.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/candidate_info_widget.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/detail_candidate_skeleton.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';
import 'bloc/detail_candidate_loader/detail_candidate_loader_bloc.dart';
import 'bloc/launch_actor/launch_actor_bloc.dart';

@RoutePage()
class DetailCandidatePage extends StatelessWidget implements AutoRouteWrapper {
  const DetailCandidatePage({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCandidateLoaderBloc, DetailCandidateLoaderState>(
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail'),
            bottom: state.isLoading
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(4),
                    child: LinearProgressIndicator())
                : null,
          ),
          body: state.isLoading
              ? const DetailCandidateSkeleton()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CandidateInfoWidget(candidate: candidate),
                      const SizedBox(
                        height: 8,
                      ),
                      const CandidateAddressWidget(),
                      const SizedBox(
                        height: 8,
                      ),
                      const CandidateContactWidget(),
                    ],
                  ),
                ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<DetailCandidateLoaderBloc>()
              ..add(DetailCandidateLoaderEvent.showed(candidate.id)),
          ),
          BlocProvider(
            create: (context) => getIt<LaunchActorBloc>(),
          ),
        ],
        child: this,
      );
}

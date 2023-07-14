import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/candidate_address_widget.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/candidate_contact_widget.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/candidate_info_widget.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/detail_candidate_failure_widget.dart';
import 'package:candidate_app/features/detail_candidate/presentation/widgets/detail_candidate_skeleton.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        final hasError = state.failure != null;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail'),
            bottom: state.isLoading
                ? PreferredSize(
                    preferredSize: Size.fromHeight(4.w),
                    child: const LinearProgressIndicator())
                : null,
          ),
          body: state.isLoading
              ? const DetailCandidateSkeleton()
              : hasError
                  ? DetailCandidateFailureWidget(
                      failure: state.failure!,
                      id: candidate.id,
                    )
                  : SingleChildScrollView(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          CandidateInfoWidget(candidate: candidate),
                          SizedBox(
                            height: 8.w,
                          ),
                          const CandidateAddressWidget(),
                          SizedBox(
                            height: 8.w,
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

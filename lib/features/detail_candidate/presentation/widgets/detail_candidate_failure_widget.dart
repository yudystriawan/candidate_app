import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../bloc/detail_candidate_loader/detail_candidate_loader_bloc.dart';

class DetailCandidateFailureWidget extends StatelessWidget {
  const DetailCandidateFailureWidget({
    Key? key,
    required this.failure,
    required this.id,
  }) : super(key: key);

  final Failure failure;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          failure.maybeMap(
            orElse: () => 'Something went wrong',
            serverError: (value) => 'Server error, try again later',
            unableToFetch: (_) => 'Failed to get data, try again later',
          ),
        ),
        ElevatedButton(
          onPressed: () => context
              .read<DetailCandidateLoaderBloc>()
              .add(DetailCandidateLoaderEvent.showed(id)),
          child: const Text('Retry'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../bloc/home_loader/home_loader_bloc.dart';

class HomeFailureWidget extends StatelessWidget {
  const HomeFailureWidget({
    Key? key,
    required this.failure,
  }) : super(key: key);

  final Failure failure;

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
        failure.maybeMap(
          orElse: () => const SizedBox(),
          serverError: (value) => ElevatedButton(
            onPressed: () => context
                .read<HomeLoaderBloc>()
                .add(const HomeLoaderEvent.fetched()),
            child: const Text('Retry'),
          ),
        ),
      ],
    );
  }
}

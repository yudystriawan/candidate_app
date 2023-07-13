import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';

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
      ],
    );
  }
}

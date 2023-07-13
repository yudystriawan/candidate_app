import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailCandidatePage extends StatelessWidget {
  const DetailCandidatePage({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail_candidate_loader/detail_candidate_loader_bloc.dart';

class CandidateInfoWidget extends StatelessWidget {
  const CandidateInfoWidget({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCandidateLoaderBloc, DetailCandidateLoaderState>(
      buildWhen: (p, c) => p.experience != c.experience,
      builder: (context, state) {
        final status = state.experience;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(candidate.photoUrl),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${candidate.getName()} (${status.jobTitle})',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _getBackgroundColor(status),
                            ),
                            child: Text(
                              status.status,
                              style: TextStyle(
                                color: _getTextColor(status),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.cake,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        candidate.birthday.toDateFormat(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${status.companyName} (${status.industry})',
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Color _getBackgroundColor(Status status) {
    Color color = Colors.grey;
    switch (status.status) {
      case 'KIV':
        color = Colors.amber;
        break;
      case 'Rejected':
        color = Colors.red;
        break;
      case 'Shortlisted':
        color = Colors.yellow;
        break;
      case 'Hired':
        color = Colors.green;
        break;
      default:
    }

    return color;
  }

  Color _getTextColor(Status status) {
    Color color = Colors.black;
    switch (status.status) {
      case 'Shortlisted':
      case 'KIV':
        color = Colors.black;
        break;
      case 'Rejected':
      case 'Hired':
        color = Colors.white;
        break;
      default:
    }

    return color;
  }
}

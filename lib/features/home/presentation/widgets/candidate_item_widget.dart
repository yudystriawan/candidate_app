import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/core/extensions/extension.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:candidate_app/routes/router.gr.dart';
import 'package:flutter/material.dart';

class CandidateItemWidget extends StatelessWidget {
  const CandidateItemWidget({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          context.pushRoute(DetailCandidateRoute(candidate: candidate)),
      child: Card(
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
                  backgroundImage: NetworkImage(candidate.photoUrl),
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
                      candidate.getName(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.cake,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                candidate.birthday.toDateFormat(),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

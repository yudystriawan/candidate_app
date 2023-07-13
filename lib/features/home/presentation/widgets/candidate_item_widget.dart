import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:flutter/material.dart';

class CandidateItemWidget extends StatelessWidget {
  const CandidateItemWidget({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
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
                    _getName(candidate),
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
                  if (candidate.isExpired)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Expired',
                          style: TextStyle(color: Colors.white),
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

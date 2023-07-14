import 'package:candidate_app/core/extensions/extension.dart';
import 'package:candidate_app/features/detail_candidate/domain/entities/entity.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              width: 48.w,
              height: 48.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(candidate.photoUrl),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${candidate.getName()} (${status.jobTitle})',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
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
                  SizedBox(height: 4.w),
                  Row(
                    children: [
                      Icon(
                        Icons.cake,
                        size: 16.w,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        candidate.birthday.toDateFormat(),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.w),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        size: 16.w,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.w),
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

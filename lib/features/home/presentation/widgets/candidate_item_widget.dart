import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/core/extensions/extension.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:candidate_app/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 120.w,
          padding: EdgeInsets.all(12.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: CircleAvatar(
                  radius: 36.r,
                  backgroundImage: NetworkImage(candidate.photoUrl),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      candidate.getName(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.cake,
                                size: 18.w,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4.w),
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

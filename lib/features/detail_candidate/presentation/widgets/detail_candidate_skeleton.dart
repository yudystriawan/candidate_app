import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class DetailCandidateSkeleton extends StatelessWidget {
  const DetailCandidateSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SkeletonAvatar(
                style: SkeletonAvatarStyle(shape: BoxShape.circle),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    const SkeletonLine(),
                    SizedBox(height: 4.w),
                    SkeletonLine(
                      style: SkeletonLineStyle(width: 80.w),
                    ),
                    SizedBox(height: 4.w),
                    SkeletonLine(
                      style: SkeletonLineStyle(width: 90.w),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          SkeletonLine(
            style: SkeletonLineStyle(height: 60.w),
          ),
          SizedBox(
            height: 16.w,
          ),
          SkeletonLine(
            style: SkeletonLineStyle(height: 80.w),
          ),
        ],
      ),
    );
  }
}

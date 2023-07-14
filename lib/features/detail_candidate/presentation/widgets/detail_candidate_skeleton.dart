import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class DetailCandidateSkeleton extends StatelessWidget {
  const DetailCandidateSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SkeletonAvatar(
                style: SkeletonAvatarStyle(shape: BoxShape.circle),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  children: const [
                    SkeletonLine(),
                    SizedBox(height: 4),
                    SkeletonLine(
                      style: SkeletonLineStyle(width: 80),
                    ),
                    SizedBox(height: 4),
                    SkeletonLine(
                      style: SkeletonLineStyle(width: 90),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const SkeletonLine(
            style: SkeletonLineStyle(height: 60),
          ),
          const SizedBox(
            height: 16,
          ),
          const SkeletonLine(
            style: SkeletonLineStyle(height: 80),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/entity.dart';

class BlogItemWidget extends StatelessWidget {
  const BlogItemWidget({
    Key? key,
    required this.blog,
  }) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.pushRoute(DetailBlogRoute(blog: blog)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: blog.photoUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: double.infinity,
                    height: 160.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: Image.network(
                      blog.photoUrl,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Text(
                blog.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                blog.subtitle,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12.w),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Read more...',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

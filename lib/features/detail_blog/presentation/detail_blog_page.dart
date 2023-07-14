import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/core/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/domain/entities/entity.dart';

@RoutePage()
class DetailBlogPage extends StatelessWidget {
  const DetailBlogPage({
    Key? key,
    required this.blog,
  }) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                blog.title,
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp),
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            Row(
              children: [
                Text(
                  'By ${blog.author}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Text(
                    blog.createdAt.toDateFormat('d MMMM yyyy hh:mm'),
                    style: TextStyle(fontSize: 12.sp),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.w,
            ),
            Hero(
              tag: blog.photoUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
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
            SizedBox(
              height: 4.w,
            ),
            Text(
              blog.subtitle,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              blog.content,
              textAlign: TextAlign.left,
            ),
            Divider(
              height: 16.w,
            ),
            Text('Tag: ${blog.tag}'),
          ],
        ),
      ),
    );
  }
}

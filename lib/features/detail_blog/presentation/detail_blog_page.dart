import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/core/extensions/extension.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                blog.title,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  'By ${blog.author}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Text(
                    blog.createdAt.toDateFormat('d MMMM yyyy hh:mm'),
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Hero(
              tag: blog.photoUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  height: 160,
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
            const SizedBox(
              height: 4,
            ),
            Text(
              blog.subtitle,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              blog.content,
              textAlign: TextAlign.left,
            ),
            const Divider(
              height: 16,
            ),
            Text('Tag: ${blog.tag}'),
          ],
        ),
      ),
    );
  }
}

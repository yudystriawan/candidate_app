part of 'entity.dart';

@freezed
class Blog with _$Blog {
  const Blog._();
  const factory Blog({
    required int id,
    required String title,
    required String subtitle,
    required String photoUrl,
    required String content,
    required String author,
    required int createdAt,
    required String tag,
  }) = _Blog;

  factory Blog.empty() {
    return const Blog(
      id: 0,
      title: '',
      subtitle: '',
      photoUrl: '',
      content: '',
      author: '',
      createdAt: 0,
      tag: '',
    );
  }
}

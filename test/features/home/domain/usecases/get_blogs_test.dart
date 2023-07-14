import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/home/domain/entities/entity.dart';
import 'package:candidate_app/features/home/domain/repositories/blog_repository.dart';
import 'package:candidate_app/features/home/domain/usecases/get_blogs.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_blogs_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BlogRepository>()])
void main() {
  final mockRepository = MockBlogRepository();
  final sut = GetBlogs(mockRepository);

  final blogs = KtList.from([
    Blog(
      id: 1,
      title: 'test title',
      subtitle: 'test subtitle',
      photoUrl: 'https://photo-url.com',
      content: 'test content',
      author: 'test author',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      tag: 'test, tag',
    ),
    Blog(
      id: 2,
      title: 'test title',
      subtitle: 'test subtitle',
      photoUrl: 'https://photo-url.com',
      content: 'test content',
      author: 'test author',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      tag: 'test, tag',
    ),
    Blog(
      id: 3,
      title: 'hohohoho',
      subtitle: 'test subtitle',
      photoUrl: 'https://photo-url.com',
      content: 'test content',
      author: 'test author',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      tag: 'test, tag',
    ),
  ]);

  void setupMockSuccessResponse(String? query) {
    when(mockRepository.getBlogs(query: query)).thenAnswer(
      (realInvocation) async {
        if (query != null && query.isNotEmpty) {
          final filteredBlogs = blogs
              .filter((blog) => blog.title.toLowerCase().contains(query))
              .toList();
          return right(filteredBlogs);
        }

        return right(blogs);
      },
    );
  }

  void setupMockFailureResponse(String? query) {
    when(mockRepository.getBlogs(query: query)).thenAnswer(
      (realInvocation) async => left(const Failure.unexpectedError()),
    );
  }

  test('should get blogs', () async {
    const query = null;
    setupMockSuccessResponse(query);

    final result = await sut(const Params(query));

    expect(result, Right(blogs));
    verify(mockRepository.getBlogs(query: query));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should get blogs that have query in title', () async {
    const query = 's';
    final expectedBlogs = blogs
        .filter((blog) => blog.title.toLowerCase().contains(query))
        .toList();

    setupMockSuccessResponse(query);

    final result = await sut(const Params(query));

    expect(result, Right(expectedBlogs));
    verify(mockRepository.getBlogs(query: query));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when get status fails', () async {
    setupMockFailureResponse(null);

    final result = await sut(const Params(null));

    expect(result.isLeft(), true);
    verify(mockRepository.getBlogs());
    verifyNoMoreInteractions(mockRepository);
  });
}

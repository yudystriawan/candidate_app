import 'dart:developer';

import 'package:candidate_app/features/blogs/data/datasources/blog_remote_data_source.dart';
import 'package:candidate_app/features/blogs/domain/entities/blog.dart';
import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/blogs/domain/repository/blog_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/src/collection/kt_list.dart';
import 'package:dartz/dartz.dart';

@Injectable(as: BlogRepository)
class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource _remoteDataSource;

  BlogRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, KtList<Blog>>> getBlogs({String? query}) async {
    try {
      final result = await _remoteDataSource.getBlogs(query: query);
      final blogs = result.results?.map((e) => e.toDomain()).toList();

      return right(KtList.from(blogs ?? []));
    } on Failure catch (e) {
      return left(e);
    } catch (e, s) {
      log('getBlogsFailure', error: e, stackTrace: s);
      return left(const Failure.unexpectedError());
    }
  }
}

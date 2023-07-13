import 'dart:developer';

import 'package:candidate_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/blog_repository.dart';
import '../datasources/blog_remote_data_source.dart';

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

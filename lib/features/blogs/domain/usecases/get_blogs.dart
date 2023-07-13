import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/core/usecases/usecase.dart';
import 'package:candidate_app/features/blogs/domain/repository/blog_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../entities/blog.dart';

@injectable
class GetBlogs implements Usecase<KtList<Blog>, Params> {
  final BlogRepository _repository;

  GetBlogs(this._repository);

  @override
  Future<Either<Failure, KtList<Blog>>> call(Params params) async {
    return await _repository.getBlogs(query: params.query);
  }
}

class Params extends Equatable {
  final String? query;

  const Params(this.query);

  @override
  List<Object?> get props => [query];
}

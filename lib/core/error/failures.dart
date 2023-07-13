import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError({
    int? statusCode,
    String? message,
    RequestOptions? requestOptions,
  }) = _ServerError;
  const factory Failure.unexpectedError() = _UnexpectedError;
  const factory Failure.notFound() = _NotFound;
}

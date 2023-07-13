import 'package:candidate_app/core/http_client/base_http_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';

@lazySingleton
class CandidateClient extends BaseHttpClient {
  CandidateClient()
      : super(
          'https://private-b9a758-candidattest.apiary-mock.com',
          getIt<Dio>(),
        );
}

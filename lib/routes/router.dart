import 'package:auto_route/auto_route.dart';
import 'package:candidate_app/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: HomeRoute.page, initial: true),
      AutoRoute(page: DetailCandidateRoute.page),
      AutoRoute(page: DetailBlogRoute.page),
    ];
  }
}

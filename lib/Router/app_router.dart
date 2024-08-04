import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignInRoute.page,initial: true),
    AutoRoute(page: DashboardRoute.page,children: [
      AutoRoute(
        page: HomeRoute.page,
      ),
      AutoRoute(
        page: SearchRoute.page,
      ),
      AutoRoute(
        page: DownloadRoute.page,
      ),
      AutoRoute(
        page: ProfileRoute.page,
      ),
    ]),
    AutoRoute(page: SearchPageRoute.page,),
  ];
}
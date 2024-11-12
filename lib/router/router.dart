import 'package:auto_route/auto_route.dart';
import 'package:flutter_rhymes/features/favorites/favorites.dart';
import 'package:flutter_rhymes/features/history/history.dart';
import 'package:flutter_rhymes/features/home/home.dart';
import 'package:flutter_rhymes/features/search/search.dart';
import 'package:flutter_rhymes/features/settings/settings.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: FavorivesRoute.page, path: '/favorites'),
        AutoRoute(page: SearchRoute.page, path: '/search'),
        AutoRoute(page: HistoryRoute.page, path: '/history'),
        AutoRoute(page: SettingsRoute.page, path: '/settings'),
      ];
}

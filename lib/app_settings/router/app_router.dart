// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_demo_news_app/app_settings/router/router_utils.dart';
import 'package:flutter_demo_news_app/modules/models/article.dart';
import 'package:flutter_demo_news_app/screens/error/error_screen.dart';
import 'package:flutter_demo_news_app/screens/news/news_screen.dart';
import 'package:flutter_demo_news_app/screens/news_detail/news_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: AppRoutes.news.getName,
        path: AppRoutes.news.getPath,
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: const NewsScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.newsDetail.getName,
        path: AppRoutes.newsDetail.getPath,
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: NewsDetailScreen(
              article: state.extra as Article,
            ),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorScene(error: state.error),
    ),
  );

  static goToRoot(BuildContext context) {
    Router.neglect(context, () => context.pushNamed(AppRoutes.news.getName));
  }

  static navigateToNewsDetails(BuildContext context, Article article) => context.pushNamed(
        AppRoutes.newsDetail.getName,
        extra: article,
      );
}

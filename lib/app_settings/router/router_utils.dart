enum AppRoutes {
  news,
  newsDetail,
}

extension AppRoutesExt on AppRoutes {
  String get getPath {
    switch (this) {
      case AppRoutes.news:
        return '/';
      case AppRoutes.newsDetail:
        return '/newsDetail';
      default:
        return '/';
    }
  }

  String get getName {
    switch (this) {
      case AppRoutes.news:
        return 'newsScreen';
      case AppRoutes.newsDetail:
        return 'newsDetailScreen';
      default:
        return 'newsScreen';
    }
  }
}

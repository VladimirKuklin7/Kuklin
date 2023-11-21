// enum для путей
enum APP_PAGE {
  onboard,
  auth,
  home,
  search
}

extension AppPageExtension on APP_PAGE {
  // пути
  String get routePath {
    switch (this) {
      case APP_PAGE.home:
        return "/";

      case APP_PAGE.onboard:
        return "/onboard";

      case APP_PAGE.auth:
        return "/auth";

      case APP_PAGE.search:
        return "/search";

      default:
        return "/";
    }
  }

  String get routeName {
    switch (this) {
      case APP_PAGE.home:
        return "ГЛАВНАЯ";

      case APP_PAGE.onboard:
        return "ВВЕДЕНИЕ";

      case APP_PAGE.auth:
        return "АВТОРИЗАЦИЯ";

      case APP_PAGE.search:
        return "Поиск";

      default:
        return "ГЛАВНАЯ";
    }
  }

// appbar
  String get routePageTitle {
    switch (this) {
      case APP_PAGE.home:
        return "ГЛАВНАЯ";

      case APP_PAGE.onboard:
        return "ВВЕДЕНИЕ";
      
      case APP_PAGE.auth:
        return "АВТОРИЗАЦИЯ";
      
      case APP_PAGE.search:
        return "Поиск";

      default:
        return "Astha";
    }
  }
}

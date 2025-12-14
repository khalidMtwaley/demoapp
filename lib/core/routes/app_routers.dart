part of 'app_routers_import.dart';

class AppRouters {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
     
      // case RoutesName.splashScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => Spa(
      //       model: args,
      //     ),
      //   );
      case RoutesName.mainOnBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      default:
        return null;
    }
  }
}

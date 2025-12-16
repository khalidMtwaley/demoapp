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
      // login

      case RoutesName.mainOnBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case RoutesName.registerSelectAvatarScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterSelectAvatarScreen(),
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RoutesName.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      default:
        return null;
    }
  }
}

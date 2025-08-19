import 'package:auto_route/auto_route.dart';
import 'package:frontend/features/auth/presentation/screens/login_screen.dart';
import 'package:frontend/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:frontend/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:frontend/features/onboarding/presentation/screens/omboarding_screen.dart';
import 'package:frontend/features/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          fullMatch: true,
          page: SplashRoute.page,
          restorationId: (m) => m.fullPath,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          fullMatch: true,
          restorationId: (m) => m.fullPath,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          fullMatch: true,
          restorationId: (m) => m.fullPath,
        ),
        AutoRoute(
          page: LoginRoute.page,
          fullMatch: true,
          restorationId: (m) => m.fullPath,
        ),
        AutoRoute(
          page: SignUpRoute.page,
          fullMatch: true,
          restorationId: (m) => m.fullPath,
        ),
      ];
}

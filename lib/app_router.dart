// packages
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
// custom
import 'router_utils.dart';
import 'home.dart';
import 'onboard_screen.dart';
import 'app_state_provider.dart';
import 'auth_screen.dart';

class AppRouter {
  AppRouter({
    required this.appStateProvider,
    required this.prefs,
  });

  AppStateProvider appStateProvider;
  late SharedPreferences prefs;
  get router => _router;

  // change final to late final to use prefs inside redirect.
  late final _router = GoRouter(
      refreshListenable:
          appStateProvider,
      initialLocation: "/",
      routes: [

        // home
        GoRoute(
          path: APP_PAGE.home.routePath,
          name: APP_PAGE.home.routeName,
          builder: (context, state) => const Home(),
        ),

        // onboard screen
        GoRoute(
            path: APP_PAGE.onboard.routePath,
            name: APP_PAGE.onboard.routeName,
            builder: (context, state) => const OnBoardScreen()),
        
        // auth
        GoRoute(
          path: APP_PAGE.auth.routePath,
          name: APP_PAGE.auth.routeName,
          builder: (context, state) => const AuthScreen(),
        )
      ],
      redirect: (state) {
        // define the named path of onboard screen
        final String onboardPath =
            state.namedLocation(APP_PAGE.onboard.routeName);

        // Checking if current path is onboarding or not
        bool isOnboarding = state.subloc == onboardPath;

        // check if sharedPref as onBoardCount key or not
        //if is does then we won't onboard else we will
        bool toOnboard =
            prefs.containsKey('onBoardCount') ? false : true;

        if (toOnboard) {
          // return null if the current location is already OnboardScreen to prevent looping
          return isOnboarding ? null : onboardPath;
        }
        // returning null will tell router to don't mind redirect section
        return null;
      });
}
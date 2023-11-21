import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';
import 'app_state_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

class MyApp extends StatefulWidget {
  SharedPreferences prefs; 
  MyApp({required this.prefs, Key? key}) : super(key: key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider()),
        ProxyProvider<AppStateProvider, AppRouter>(
            update: (context, appStateProvider, _) => AppRouter(
                appStateProvider: appStateProvider, prefs: widget.prefs))
      ],
      child: Builder(
        builder: ((context) {
          final GoRouter router = Provider.of<AppRouter>(context).router;

          return MaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              theme: defaultTheme,
              routerDelegate: router.routerDelegate);
        }),
      ),
    );
  }
}
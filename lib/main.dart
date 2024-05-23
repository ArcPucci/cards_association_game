import 'dart:async';

import 'package:association_card_game/providers/game_provider.dart';
import 'package:association_card_game/providers/store_provider.dart';
import 'package:association_card_game/screens/screens.dart';
import 'package:association_card_game/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUri(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final preferences = await SharedPreferences.getInstance();
    final preferencesService = PreferencesService(preferences: preferences);

    runApp(ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MyApp(preferencesService: preferencesService);
      },
    ));
  }, (error, stack) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stack);
  });
}

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.preferencesService});

  final PreferencesService preferencesService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/splash_screen',
      routes: [
        GoRoute(
          path: '/splash_screen',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: SplashScreen(),
            );
          },
        ),
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: MainScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'single_game',
              pageBuilder: (context, state) {
                final path = state.fullPath;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SinglePlayerScreen(path: path!),
                );
              },
              routes: [
                GoRoute(
                  path: 'game_screen',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: GameScreen(),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'next_association_screen',
                      pageBuilder: (context, state) {
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: NextAssociationScreen(),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'result_screen',
                      pageBuilder: (context, state) {
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: ResultScreen(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: 'tourney_game',
              pageBuilder: (context, state) {
                final path = state.fullPath;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SinglePlayerScreen(
                    tourney: true,
                    path: path!,
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: 'game_screen',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: GameScreen(),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'next_association_screen',
                      pageBuilder: (context, state) {
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: NextAssociationScreen(),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'result_screen',
                      pageBuilder: (context, state) {
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: ResultScreen(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: 'two_game',
              pageBuilder: (context, state) {
                final path = state.fullPath;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: MultiplePlayersScreen(path: path!),
                );
              },
              routes: [
                GoRoute(
                  path: 'game_screen',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: GameScreen(),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'next_association_screen',
                      pageBuilder: (context, state) {
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: NextAssociationScreen(),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'result_screen',
                      pageBuilder: (context, state) {
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: ResultScreen(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: 'shop_screen',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const ShopScreen(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => widget.preferencesService),
        ChangeNotifierProvider(
          create: (context) =>
              StoreProvider(preferencesService: widget.preferencesService)
                ..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => GameProvider(
            router: _router,
            storeProvider: Provider.of(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}

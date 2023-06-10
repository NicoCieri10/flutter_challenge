import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/theme/theme.dart';
import 'package:flutter_challenge/views/views.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: myThemeLight.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return AppSize.child(
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => const RoutingErrorPage(),
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/product',
        name: 'product',
        builder: (context, state) => const ProductPage(),
      ),
    ],
  );
}

class RoutingErrorPage extends StatelessWidget {
  const RoutingErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No hay rutas',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/src/ui/detail.dart';

import '../ui/home.dart';

GlobalKey<NavigatorState> _mfRootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellKeys');
final router = GoRouter(
  navigatorKey: _mfRootNavigatorKey,
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) {
          return const Home();
        },
        routes: [
          GoRoute(
            name: 'detail',
            path: 'detail',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: Detail()),
          )
        ])
  ],
);

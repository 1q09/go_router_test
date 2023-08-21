import 'package:flutter/material.dart';
import 'package:go_router_test/src/routes/routes.dart';

late GlobalKey<NavigatorState> navigationKeyMF;

class GoTest {
  final GlobalKey<NavigatorState> navigationKey;

  GoTest({required this.navigationKey});

  void launchMyPackageScreen({Map<String, dynamic>? extras}) {
    navigationKeyMF = navigationKey;
    final BuildContext? context = navigationKey.currentContext;
    if (context == null) {
      throw Exception('context can not be null');
    }
    Navigator.of(context).push(MaterialPageRoute<dynamic>(
      builder: (context) => WillPopScope(
          onWillPop: () {
            if (router.canPop()) {
              router.pop();
              return Future.value(true);
            }
            return Future.value(true);
          },
          child: const AppStartPoint()),
    ));
  }
}

class AppStartPoint extends StatefulWidget {
  const AppStartPoint({super.key});

  @override
  State<AppStartPoint> createState() => _AppStartPointState();
}

class _AppStartPointState extends State<AppStartPoint> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Neo Mutual Fund',
      builder: (context, Widget? child) {
        return Stack(
          children: [
            child!,
          ],
        );
      },
    );
  }
}

void closeApp() {
  Navigator.pop(navigationKeyMF.currentContext!);
}

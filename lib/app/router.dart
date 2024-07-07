import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_qr/screens/home/home_screen.dart';
import 'package:smart_qr/screens/preview_qr/qr_preview_screen.dart';
import 'package:smart_qr/screens/scan_qr/scan_qr_screen.dart';

import '../screens/splash/splash_screen.dart';
import '../utils/log.dart';

/// router name
class AppRouteName {
  static const splash = '/';
  static const home = '/home';
  static const qrPreview = '/qr_preview';
  static const scanRQ = '/scan_qr';
  static const resultScan = '/result_scan';
}

class AppRouteParam {
  static const qrPreview = 'qr_preview';
}

class AppRouter {
  AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  static BuildContext? get context => navigatorKey.currentContext;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    LOG.debug('[onGenerateRoute]: ${settings.name}, ${settings.arguments}');

    final params = (settings.arguments is Map)
        ? settings.arguments as Map
        : <dynamic, dynamic>{};

    switch (settings.name) {
      case AppRouteName.splash:
        return StandardPageRoute<Widget>(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case AppRouteName.home:
        return StandardPageRoute<Widget>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case AppRouteName.qrPreview:
        final content = params[AppRouteParam.qrPreview];
        return StandardPageRoute<Widget>(
          builder: (_) => QrPreviewScreen(content: content),
          settings: settings,
        );
      case AppRouteName.scanRQ:
        return StandardPageRoute<Widget>(
          builder: (_) => const ScanQrScreen(),
          settings: settings,
        );
    }

    LOG.error('"${settings.name}" is not defined');
    return null;
  }
}

class StandardPageRoute<T> extends CupertinoPageRoute<T> {
  StandardPageRoute({
    required super.builder,
    required RouteSettings super.settings,
    super.maintainState,
  });

  @override
  @protected
  bool get hasScopedWillPopCallback {
    return true;
  }
}

class NoEffectPageRoute<T> extends MaterialPageRoute<T> {
  NoEffectPageRoute({
    required super.builder,
    required RouteSettings super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });

  @override
  Duration get transitionDuration => Duration.zero;

  // If it return true, SwipePopGesture will be disabled.
  @override
  @protected
  bool get hasScopedWillPopCallback {
    return true;
  }
}

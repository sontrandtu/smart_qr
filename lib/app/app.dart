import 'package:smart_qr/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_qr/constants/colors.dart';

import '../base/common_provider.dart';
import '../themes/theme.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final _commonProvider = CommonNotifier.provider;

  @override
  Widget build(BuildContext context) {
    final commonState = ref.watch(_commonProvider);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: Stack(
              children: [
                child!,
                ...commonState.modal.entries.map((e) => e.value),
                if (commonState.loading != null) commonState.loading!
              ],
            ),
          );
        },
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        navigatorKey: AppRouter.navigatorKey,
        initialRoute: AppRouteName.splash,
        color: AppColors.kPrimary,
      ),
    );
  }
}

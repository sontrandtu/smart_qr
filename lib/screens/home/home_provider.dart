import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_qr/app/router.dart';
import 'package:smart_qr/base/base_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_qr/constants/constants.dart';

class HomeNotifier extends BaseProvider<HomeState> {
  static final List<String> titleTabs = ["設定1", "通信設定"];

  HomeNotifier(ref) : super(HomeState(currentTabIndex: 0), ref);

  late PageController pageController;
  late TextEditingController textController;

  static final provider =
      StateNotifierProvider.autoDispose<HomeNotifier, HomeState>(
    (ref) => HomeNotifier(ref),
  );

  void init() {
    pageController = PageController(initialPage: 0);
    textController = TextEditingController();
  }

  void changeTab(int index) {
    state = state.copyWith(currentTabIndex: index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  Future<void> onGenerateQR() async {
    String content = textController.text;
    if (content.isEmpty) {
      showErrorDialog(
        context: AppRouter.context,
        message: Messages.emptyQRContentError,
      );
    } else {
      AppRouter.navigator!.pushNamed(
        AppRouteName.qrPreview,
        arguments: {AppRouteParam.qrPreview: content},
      );
    }
  }
}

class HomeState {
  HomeState({
    required this.currentTabIndex,
  });

  int currentTabIndex;

  HomeState copyWith({int? currentTabIndex}) {
    return HomeState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
    );
  }
}

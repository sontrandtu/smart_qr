import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/colors.dart';
import '../utils/utils.dart';
import 'base_provider.dart';

class CommonNotifier extends BaseProvider<CommonState> {
  CommonNotifier(ref)
      : super(CommonState(modal: HashMap(), loading: null), ref);

  static final provider = StateNotifierProvider<CommonNotifier, CommonState>(
    (ref) => CommonNotifier(ref),
  );

  // Modal, Loading, Dialog
  @override
  void showLoading() {
    state.loading = Positioned(
      child: PopScope(
          onPopInvoked: (didPop) {},
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: Container(
              color: AppColors.backgroundAppBar.withOpacity(0.5),
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 50, maxHeight: 50),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          )),
    );
    state = state.copyWith(loading: state.loading);
  }

  @override
  void closeLoading() {
    if (state.loading != null) {
      state = state.copyWith(loading: null);
    }
  }

  void showModal({
    required String title,
    required String message,
    Color backgroundColorTitle = Colors.red,
    Color backgroundColorContent = Colors.red,
    TextStyle? messageTextStyle,
    String titleButtonYes = 'は　い',
    String titleButtonNo = 'いいえ',
    VoidCallback? onHandelYes,
    VoidCallback? onHandelNo,
    bool isShowNo = true,
    dynamic id = 0,
  }) {
    if (id == 0) {
      id = Utils.uuid;
    }
    state.modal[id] = Positioned(
      child: PopScope(
          onPopInvoked: (value) {},
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: Container(),
          )),
    );
    state = state.copyWith(modal: state.modal);
  }

  void close(dynamic id) {
    if (state.modal.containsKey(id)) {
      state.modal.remove(id);
      state = state.copyWith(modal: state.modal);
    }
  }
}

class CommonState {
  CommonState({required this.modal, required this.loading});

  HashMap<dynamic, Widget> modal;
  Widget? loading;

  CommonState copyWith({HashMap<dynamic, Widget>? modal, Widget? loading}) {
    return CommonState(
      modal: modal ?? this.modal,
      loading: loading,
    );
  }
}

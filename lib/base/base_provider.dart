import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_qr/constants/colors.dart';
import 'package:smart_qr/constants/constants.dart';
import 'package:smart_qr/themes/theme.dart';
import 'package:smart_qr/widgets/app_elevated_button.dart';
import 'package:smart_qr/widgets/app_text_content.dart';

import 'common_provider.dart';

abstract class BaseProvider<T> extends StateNotifier<T> {
  Ref ref;

  BaseProvider(super.state, this.ref);

  final commonProvider = CommonNotifier.provider;

  void showLoading() {
    ref.read(commonProvider.notifier).showLoading();
  }

  void closeLoading() {
    ref.read(commonProvider.notifier).closeLoading();
  }

  void closeDialog(dynamic id) {
    ref.read(commonProvider.notifier).close(id);
  }

  Future<R?> appDialog<R>({
    required BuildContext context,
    String title = '確認',
    required String message,
    Widget? messageWidget,
    TextStyle? messageTextStyle,
    TextAlign messageAlign = TextAlign.center,
    String titleButtonYes = 'は　い',
    String titleButtonNo = 'いいえ',
    VoidCallback? onHandelYes,
    VoidCallback? onHandelNo,
    bool isShowNo = true,
    bool isError = false,
    bool barrierDismissible = false,
  }) async {
    R? result = await showDialog<R>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return const Text("TEXT");
        });
    return result;
  }

  Future<R?> showErrorDialog<R>({
    BuildContext? context,
    String? title,
    required String message,
    Widget? messageWidget,
    TextStyle? messageTextStyle,
    TextAlign messageAlign = TextAlign.center,
    String titleButtonYes = 'は　い',
    String titleButtonNo = 'いいえ',
    VoidCallback? onClose,
    bool barrierDismissible = false,
  }) async {
    if (context == null) return null;

    R? result = await showDialog<R>(
        context: context,
        builder: (context) {
          return AlertDialog(
            titleTextStyle: AppTheme.txtTitleDialog,
            title: Align(
              alignment: Alignment.center,
              child: Text(title ?? Constants.notification),
            ),
            actionsAlignment: MainAxisAlignment.center,
            alignment: Alignment.center,
            content: AppTextContent(text: message, textAlign: messageAlign),
            actions: [
              AppElevatedButton(
                title: Constants.close,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onPressed: onClose ?? () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
    return result;
  }

  void showSuccessToast({
    required String message,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.kSecondary2,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

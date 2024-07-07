import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:smart_qr/app/router.dart';
import 'package:smart_qr/base/base_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_qr/constants/constants.dart';
import 'package:smart_qr/extensions/string_extension.dart';

class QrPreviewProvider extends BaseProvider<QrPreviewState> {
  static final List<String> titleTabs = ["設定1", "通信設定"];

  QrPreviewProvider(ref) : super(QrPreviewState(), ref);

  static final provider =
      StateNotifierProvider.autoDispose<QrPreviewProvider, QrPreviewState>(
    (ref) => QrPreviewProvider(ref),
  );

  Future<void> init(String content) async {
    showLoading();
    if (content.isEmpty) {
      closeLoading();
      showErrorDialog(
        context: AppRouter.context,
        message: Messages.emptyQRContentError,
        onClose: () => AppRouter.navigator!
            .popUntil(ModalRoute.withName(AppRouteName.home)),
      );
    } else {
      final qrCode = QrCode.fromData(
        data: content,
        errorCorrectLevel: QrErrorCorrectLevel.H,
      );
      final qrImage = QrImage(qrCode);
      final qrImageBytes = await qrImage.toImageAsBytes(
        size: 512,
        format: ImageByteFormat.png,
        decoration: const PrettyQrDecoration(
          background: Colors.white,
          shape: PrettyQrRoundedSymbol(),
        ),
      );
      if (qrImageBytes == null) {
        closeLoading();
        showErrorDialog(
          context: AppRouter.context,
          message: Messages.errorCreateQR,
          onClose: () => AppRouter.navigator!
              .popUntil(ModalRoute.withName(AppRouteName.home)),
        );
        return;
      }
      final data = qrImageBytes.buffer.asUint8List();
      if (data.isEmpty) {
        closeLoading();
        showErrorDialog(
          context: AppRouter.context,
          message: Messages.errorCreateQR,
          onClose: () => AppRouter.navigator!
              .popUntil(ModalRoute.withName(AppRouteName.home)),
        );
        return;
      }
      state = state.copyWith(bytesData: data);
      closeLoading();
    }
  }

  void onSave() async {
    if (state.bytesData == null) return;
    try {
      await Gal.putImageBytes(
        state.bytesData!,
        album: 'Smart QR',
        name: 'QR'.randomName,
      );
      showSuccessToast(message: Messages.saveFileSuccess);
    } on GalException catch (_) {
      showErrorDialog(
        context: AppRouter.context,
        message: Messages.errorCreateQR,
      );
    }
  }
}

class QrPreviewState {
  QrPreviewState({
    this.bytesData,
  });

  Uint8List? bytesData;

  QrPreviewState copyWith({Uint8List? bytesData}) {
    return QrPreviewState(bytesData: bytesData);
  }
}

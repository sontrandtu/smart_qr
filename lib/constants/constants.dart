import 'package:smart_qr/constants/path.dart';

import '../models/home_tab_model.dart';

class Constants {
  static List<HomeTabModel> tabs = [
    HomeTabModel(title: 'Scan', pathIcon: SvgPath.iconScan),
    HomeTabModel(title: 'Generate QR', pathIcon: SvgPath.iconPlus),
  ];

  // title

  static String notification = 'Notification';
  static String generateQR = 'Generate QR';
  static String scanNow = 'Scan now';
  static String ok = 'OK';
  static String cancel = 'Cancel';
  static String close = 'Close';
  static String qrPreview = 'QR Preview';
  static String saveQR = 'Save QR';
}

class Messages {
  static String emptyQRContentError =
      "The content of the QR code cannot be blank";
  static String errorCreateQR =
      "An error occurred while generating QR. Please check the content and try again.";
  static String saveFileSuccess = "QR image saved to gallery";
}

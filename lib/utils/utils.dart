import 'package:smart_qr/app/router.dart';
import 'package:intl/intl.dart';

class Utils {
  /// Get message
  ///
  /// Parameter [String] message
  /// Parameter [List<String>] param
  /// Return [bool]
  static String getMessage(String message, List<String> param) {
    if (param.isEmpty) {
      return message;
    }
    for (int i = 0; i < param.length; i++) {
      message = message.replaceAll('{$i}', param[i]);
    }
    return message;
  }

  /// Validate Email
  ///
  /// Parameter [String] value
  /// Return [bool]
  static bool isEmail(String value) {
    return RegExp(r'^([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,})$')
        .hasMatch(value);
  }

  /// Check validate All
  ///
  /// Parameter [List<String>] listMessage
  /// Return [bool]
  static bool validAll(List<String> listMessage) {
    bool invalid = false;
    for (var el in listMessage) {
      if (el.isNotEmpty) {
        invalid = true;
        break;
      }
    }
    return invalid;
  }

  /// Format Currency
  ///
  /// Parameter [int] currency
  static formatCurrency(int currency) {
    return NumberFormat.currency(locale: "ja_JP", symbol: "").format(currency);
  }

  /// Date Format
  ///
  /// Parameter [DateTime] date
  /// Parameter [String] pattern
  /// Return [String]
  static String dateFormat(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }

  static int get uuid => DateTime.now().microsecondsSinceEpoch;

  static void appRouter(int num) {
    for (var i = 0; i < num; i++) {
      if (AppRouter.navigator!.canPop()) {
        AppRouter.navigator?.pop();
      }
    }
  }
}

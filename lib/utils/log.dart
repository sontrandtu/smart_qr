import 'package:flutter/foundation.dart';

class LOG {
  static void debug(Object object) async {
    if (kDebugMode) {
      print("===========================");
      print("💚 $object");
      print("===========================");
    }
  }

  static void error(Object object) async {
    if (kDebugMode) {
      print("===========================");
      print("❤️ $object");
      print("===========================");
    }
  }

  static void warning(Object object) async {
    if (kDebugMode) {
      print("===========================");
      print("💛️ $object");
      print("===========================");
    }
  }
}

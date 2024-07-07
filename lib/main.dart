import 'package:smart_qr/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

void main() {
  setUpInjector();
  runApp(const ProviderScope(child: App()));
}

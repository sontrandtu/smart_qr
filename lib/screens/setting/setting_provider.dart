import 'package:smart_qr/base/base_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingNotifier extends BaseProvider<SettingState> {
  static final List<String> titleTabs = ["設定1", "通信設定"];

  SettingNotifier(ref) : super(SettingState(s: '0'), ref);

  static final provider =
      StateNotifierProvider.autoDispose<SettingNotifier, SettingState>(
    (ref) => SettingNotifier(ref),
  );
}

class SettingState {
  SettingState({
    required this.s,
  });

  String s;

  SettingState copyWith({String? s}) {
    return SettingState(s: s ?? this.s);
  }
}

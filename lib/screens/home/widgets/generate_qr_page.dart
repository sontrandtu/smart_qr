import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_qr/constants/constants.dart';
import 'package:smart_qr/screens/home/home_provider.dart';
import 'package:smart_qr/utils/responsive.dart';

import '../../../constants/path.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_text_field.dart';

class GenerateQrPage extends ConsumerWidget {
  const GenerateQrPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = HomeNotifier.provider;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: Lottie.asset(LottiePath.notFound)),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                  controller: ref.read(provider.notifier).textController,
                ),
                SizedBox(height: Responsive.getSize(20)),
                AppElevatedButton(
                  onPressed: ref.read(provider.notifier).onGenerateQR,
                  title: Constants.generateQR,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

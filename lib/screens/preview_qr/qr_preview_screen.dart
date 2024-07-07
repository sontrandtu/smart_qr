import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_qr/constants/constants.dart';
import 'package:smart_qr/screens/preview_qr/qr_preview_provider.dart';
import 'package:smart_qr/widgets/app_elevated_button.dart';
import 'package:smart_qr/widgets/app_layout.dart';
import 'package:smart_qr/widgets/app_text_content.dart';

import '../../constants/colors.dart';

class QrPreviewScreen extends ConsumerStatefulWidget {
  const QrPreviewScreen({super.key, required this.content});

  final String content;

  @override
  ConsumerState<QrPreviewScreen> createState() => _QrPreviewScreenState();
}

class _QrPreviewScreenState extends ConsumerState<QrPreviewScreen> {
  final _provider = QrPreviewProvider.provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await ref.read(_provider.notifier).init(widget.content);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(_provider).bytesData;
    return AppLayout(
      title: Constants.generateQR,
      body: value == null
          ? const SizedBox()
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: double.infinity),
                  Container(
                    width: 160,
                    height: 160,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.kTextColor,
                        width: 2,
                      ),
                    ),
                    child: Image.memory(value),
                  ),
                  const SizedBox(height: 16),
                  AppTextContent(text: Constants.qrPreview),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      title: Constants.saveQR,
                      onPressed: ref.read(_provider.notifier).onSave,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
    );
  }
}

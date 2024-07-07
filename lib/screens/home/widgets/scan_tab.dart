import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_qr/app/router.dart';
import 'package:smart_qr/utils/responsive.dart';
import 'package:smart_qr/widgets/app_elevated_button.dart';

import '../../../constants/constants.dart';
import '../../../constants/path.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(LottiePath.scanQR, height: Responsive.getSize(180)),
        AppElevatedButton(
          onPressed: () => AppRouter.navigator?.pushNamed(AppRouteName.scanRQ),
          title: Constants.scanNow,
        ),
      ],
    );
  }
}

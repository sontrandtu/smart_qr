import 'package:flutter/cupertino.dart';
import 'package:smart_qr/themes/theme.dart';

class AppTextContent extends StatelessWidget {
  const AppTextContent({super.key, required this.text, this.textAlign});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTheme.txtContent,
      textAlign: textAlign,
    );
  }
}

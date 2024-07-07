import 'package:flutter/material.dart';
import 'package:smart_qr/constants/colors.dart';
import 'package:smart_qr/themes/theme.dart';

class AppElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String pathIcon;
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;

  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.title = '',
    this.pathIcon = '',
    this.backgroundColor,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? AppColors.kPrimary),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          padding ?? const EdgeInsets.all(12),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: borderColor ?? (backgroundColor ?? AppColors.kPrimary),
            ),
          ),
        ),
      ),
      child: Text(title, style: AppTheme.txtTitleButton),
    );
  }
}

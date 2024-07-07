import 'package:flutter/material.dart';
import 'package:smart_qr/themes/theme.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    super.key,
    required this.body,
    this.title = '',
    this.onBack,
    this.backgroundColor,
  });
  final String title;
  final Widget body;
  final Color? backgroundColor;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: onBack ?? () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          title.toUpperCase(),
          style: AppTheme.txtTitleAppBar,
        ),
      ),
      body: body,
    );
  }
}

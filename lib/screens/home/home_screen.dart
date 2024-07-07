import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_qr/constants/colors.dart';
import 'package:smart_qr/constants/constants.dart';
import 'package:smart_qr/screens/home/home_provider.dart';
import 'package:smart_qr/screens/home/widgets/generate_qr_page.dart';
import 'package:smart_qr/screens/home/widgets/scan_tab.dart';
import 'package:smart_qr/themes/theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _provider = HomeNotifier.provider;

  @override
  void initState() {
    ref.read(_provider.notifier).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: PageView(
          controller: ref.read(_provider.notifier).pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ScanPage(),
            GenerateQrPage(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    int index = ref.watch(_provider).currentTabIndex;
    return BottomNavigationBar(
      selectedLabelStyle:
          AppTheme.txtTitle.copyWith(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      backgroundColor: AppColors.kBackground,
      currentIndex: ref.watch(_provider).currentTabIndex,
      onTap: ref.read(_provider.notifier).changeTab,
      items: Constants.tabs
          .map<BottomNavigationBarItem>(
            (e) => BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(
                  e.pathIcon,
                  colorFilter: ColorFilter.mode(
                    (index == Constants.tabs.indexOf(e))
                        ? AppColors.kTextColor
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: e.title,
            ),
          )
          .toList(),
    );
  }
}

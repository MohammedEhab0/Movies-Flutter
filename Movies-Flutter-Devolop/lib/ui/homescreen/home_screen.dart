import 'package:flutter/material.dart';
import 'package:movies/ui/homescreen/tabs/explore/explore_tab.dart';
import 'package:movies/ui/homescreen/tabs/home/home_tab.dart';
import 'package:movies/ui/homescreen/tabs/profile/profile_tab.dart';
import 'package:movies/ui/homescreen/tabs/search/search_tab.dart';
import 'package:movies/utils/app_assets.dart';

import 'package:movies/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabsList = [
    HomeTab(),
    ExploreTab(),
    SearchTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabsList[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.yellowColor,
          unselectedItemColor: AppColors.whiteColor,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: buildNavIcon(
                selected: selectedIndex == 0,
                icon: AppAssets.homeIcon,
                selectedIcon: AppAssets.selectedHomeIcon,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: buildNavIcon(
                selected: selectedIndex == 1,
                icon: AppAssets.explore,
                selectedIcon: AppAssets.selectedExploreIcon,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: buildNavIcon(
                selected: selectedIndex == 2,
                icon: AppAssets.search,
                selectedIcon: AppAssets.selectedSearchIcon,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: buildNavIcon(
                selected: selectedIndex == 3,
                icon: AppAssets.Profiel,
                selectedIcon: AppAssets.selectedProfielIcon,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavIcon({
    required bool selected,
    required String icon,
    required String selectedIcon,
  }) {
    return Image.asset(
      selected ? selectedIcon : icon,
      width: 24,
      height: 24,
      color: selected ? AppColors.yellowColor : AppColors.whiteColor,
    );
  }
}

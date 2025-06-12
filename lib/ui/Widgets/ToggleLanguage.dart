import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:movies/Providers/SettingProvider.dart';

class ToggleLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProviders>(context);

    // Determine the current language to control the toggle
    bool isArabic = context.locale.languageCode == 'ar';

    return AnimatedToggleSwitch<bool>.dual(
      current: isArabic,
      first: false, // English
      second: true, // Arabic
      spacing: 2.0,
      style: ToggleStyle(
        borderColor: Colors.transparent,
        backgroundColor: AppColors.blackColor,
        indicatorColor: AppColors.yellowColor,
        borderRadius: BorderRadius.circular(30),
        indicatorBorderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 45,
      borderWidth: 2.0,
      onChanged: (bool value) {
        settingProvider.changeLanguage(context, value ? 'ar' : 'en');
      },
      iconBuilder: (value) => value
          ? Image.asset(AppAssets.EGIcon)
          :  Image.asset(AppAssets.USIcon),
      // textBuilder: (value) => Text(
      //   value ? 'arabic'.tr() : 'english'.tr(),
      //   style: TextStyle(
      //     fontSize: 14,
      //     fontWeight: FontWeight.w600,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  Function onPressed;
  final IconData? icon;
  String textButton;
  Color bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  CustomElevatedButton({required this.onPressed,this.icon ,required this.textButton,
    required this.bgColor, this.textColor,
     this.textStyle,
    });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.symmetric(
                vertical: height * .02, horizontal: width * .08),
            backgroundColor: bgColor),
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              textButton,
              style:textStyle ??
                  AppStyles.regular20black.copyWith(
                    color: textColor ?? AppColors.blackColor ,
            ),
            ),
        if (icon != null) ...[
    const SizedBox(width: 6),
    Icon(icon, color: textColor ?? AppColors.blackColor),
          ],
    ],
        )
    );
  }
}

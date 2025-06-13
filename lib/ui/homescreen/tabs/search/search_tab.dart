import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/UI/Widgets/CustomTextField.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: width*.05),
          child: Column(children: [   SizedBox(height: height * .02) ,CustomTextField(
           // controller: viewModel.emailController,
            prefixIcon: Image.asset(AppAssets.search),
            hintText: 'search'.tr(),
          ),],),
        ),
      ),
    );
  }
}

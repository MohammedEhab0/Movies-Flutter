import 'package:flutter/material.dart';

import '../../../../utils/app_styles.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home", style: AppStyles.regular16yellow,)),
    );
  }
}

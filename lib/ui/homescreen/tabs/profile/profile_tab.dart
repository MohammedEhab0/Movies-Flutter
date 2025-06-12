import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Profile" ,style: AppStyles.regular16yellow,)),
    );
  }
}

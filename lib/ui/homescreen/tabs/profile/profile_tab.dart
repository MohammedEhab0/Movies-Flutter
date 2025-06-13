

import 'package:flutter/material.dart';
import 'package:movies/UI/Widgets/CustomElevatedButton.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';

import '../../../../utils/app_styles.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Column(
            children: [


              Container(
                height: 290,
                color: AppColors.lightBlack,
                padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: AppColors.whiteColor,
                          backgroundImage: AssetImage(AppAssets.character8),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text('12',style:AppStyles.bold36White),
                                  SizedBox(height: 2),
                                  Text('Wish List', style: AppStyles.bold24White),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('10', style:AppStyles.bold36White ),
                                  SizedBox(height: 2),
                                  Text('History', style:AppStyles.bold24White),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 3),
                    Text('John Safwat',
                        style: AppStyles.bold20White),
                    SizedBox(height: 6),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomElevatedButton(
                            bgColor: AppColors.yellowColor,
                            onPressed:(){

                            },
                            textButton: 'Edit profile',
                            ),

                          ),

                        SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: CustomElevatedButton(

                            textButton: 'Exit',
                            bgColor: AppColors.redColor,
                            icon: Icons.logout,
                            textColor: Colors.white,
                            textStyle: AppStyles.regular20White,
                            onPressed: () {
                              // Action
                            },
                          )

                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Container(
                      child: TabBar(
                        indicatorColor: AppColors.yellowColor,
                        indicatorSize: TabBarIndicatorSize.tab,

                        tabs: [
                          Tab(
                            icon: Icon(Icons.list, color:AppColors.yellowColor ),
                            child: Text('Watch List', style:AppStyles.regular20White ),
                          ),
                          Tab(
                            icon: Icon(Icons.folder, color: AppColors.yellowColor),
                            child: Text('History', style: AppStyles.regular20White),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // TabBar

              // TabBarView
              Expanded(
                child: Container(
                  color: Colors.black,
                  child:  TabBarView(
                    children: [
                      Center(
                        child: Image.asset(AppAssets.profileEmpty),
                      ),
                      Center(
                        child: Icon(Icons.history, size: 80, color:  AppColors.yellowColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/UI/Di/di.dart';
import 'package:movies/UI/auth/register/Cubit/register_view_model.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/dialog_utils.dart';

import '../../../utils/validators.dart';
import '../../Widgets/CustomElevatedButton.dart';
import '../../Widgets/CustomTextField.dart';
import '../../Widgets/ToggleLanguage.dart';
import '../login/Login.dart'; // Ensure Login is imported
import 'Cubit/registerStates.dart';

class Register extends StatefulWidget {
  static const routeName = 'Register';
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingStates) {
          DialogUtils.showLoading(context: context, message: "Loading ...");
        } else if (state is RegisterErrorStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.error.errorMessage,
            title: "Error",
            posActionName: "ok",
            // --- FIX: No posAction here, so it stays on Register screen after error. ---
          );
          print(state.error.errorMessage);
        } else if (state is RegisterSuccessStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: "Register Successfully",
            title: 'Success',
            posActionName: "ok",

          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.blackColor),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'register'.tr(),
            style: AppStyles.regular16yellow,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * .05),
                  SizedBox(
                    height: height * .23,
                    child: Image.asset(AppAssets.logoSplash),
                  ),
                  SizedBox(height: height * .05),
                  CustomTextField(
                    controller: viewModel.nameController,
                    prefixIcon: Image.asset(AppAssets.nameIcon),
                    hintText: 'name'.tr(),
                    textInputType: TextInputType.name,
                    validator: AppValidators.validateUsername,
                  ),
                  SizedBox(height: height * .02),
                  CustomTextField(
                    controller: viewModel.emailController,
                    prefixIcon: Image.asset(AppAssets.emailIcon),
                    hintText: 'email'.tr(),
                    textInputType: TextInputType.emailAddress,
                    validator: AppValidators.validateEmail,
                  ),
                  SizedBox(height: height * .02),
                  CustomTextField(
                    suffixIcon: Image.asset(AppAssets.eyeIcon),
                    controller: viewModel.passwordController,
                    obscureText: true,
                    prefixIcon: Image.asset(AppAssets.passwordIcon),
                    hintText: 'password'.tr(),
                    textInputType: TextInputType.text,
                    validator: AppValidators.validatePassword,
                  ),
                  SizedBox(height: height * .02),
                  CustomTextField(
                    suffixIcon: Image.asset(AppAssets.eyeIcon),
                    controller: viewModel.confirmPasswordController,
                    obscureText: true,
                    prefixIcon: Image.asset(AppAssets.passwordIcon),
                    hintText: 'Confirm password'.tr(),
                    textInputType: TextInputType.text,
                    validator: (val) => AppValidators.validateConfirmPassword(
                      val,
                      viewModel.passwordController.text,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  CustomTextField(
                    controller: viewModel.phoneController,
                    prefixIcon: Image.asset(AppAssets.phoneIcon),
                    hintText: 'phone'.tr(),
                    textInputType: TextInputType.phone,
                    validator: AppValidators.validatePhoneNumber,
                  ),
                  SizedBox(height: height * .02),
                  CustomElevatedButton(
                    onPressed: () => viewModel.register(avaterId: 1),
                    textButton: "create account".tr(),
                    bgColor: AppColors.yellowColor,
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have account'.tr(),
                        style: AppStyles.regular14White,
                      ),
                      TextButton(
                        onPressed: () {
                          // Push to Login, allowing back navigation to Register
                          Navigator.of(context).pushNamed(Login.routeName);
                        },
                        child: Text(
                          'login'.tr(),
                          style: AppStyles.bold14yellow,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ToggleLanguage(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
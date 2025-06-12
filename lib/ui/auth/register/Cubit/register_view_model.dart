import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/Data/repositories/auth/auth_repository.dart';
import 'package:movies/UI/auth/register/Cubit/registerStates.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterViewModel({required this.authRepository}) : super(RegisterInitialStates());

  AuthRepository authRepository;

  var nameController = TextEditingController(text: 'moooooo');
  var emailController = TextEditingController(text: 'mo11@mo.com');
  var passwordController = TextEditingController(text: 'Amr2510@');
  var confirmPasswordController = TextEditingController(text:'Amr2510@');
  var phoneController = TextEditingController(text: "+201141209334");
  var formKey = GlobalKey<FormState>();

  void register({required int avaterId}) async {
    if (formKey.currentState?.validate() == true) {
      var either = await authRepository.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phone: phoneController.text,
        avaterId: avaterId,
      );

      either.fold(
            (error) => emit(RegisterErrorStates(error: error)),
            (response) => emit(RegisterSuccessStates(registerResponse: response)),
      );
    }
  }
}


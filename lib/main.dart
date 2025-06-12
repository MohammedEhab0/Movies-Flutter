import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/UI/auth/login/Login.dart';
import 'package:movies/utils/my_BlocObserver.dart';
import 'package:movies/ui/homescreen/home_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/SettingProvider.dart';
import 'UI/Di/di.dart';
import 'UI/auth/register/Register.dart';
import 'utils/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SettingProviders()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingProviders = Provider.of<SettingProviders>(context);
    return MaterialApp(
 
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'Movies',
      initialRoute: Register.routeName,
      routes: {

        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        HomeScreen.routeName: (context) => HomeScreen(),

      },
       );

  }
}

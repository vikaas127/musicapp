import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:musicvic/language_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Auth/login_navigator.dart';
import 'Locale/locale.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';
import 'bloc_delegate.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocDelegate();
  final prefs = await SharedPreferences.getInstance();
  String locale = prefs.getString('locale');
  runApp(
    Phoenix(
      child: BlocProvider<LanguageCubit>(
        create: (context) => LanguageCubit(locale),
        child: MusicVic(),
      ),
    ),
  );
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MusicVic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, appLocale) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('ar'),
            const Locale('id'),
            const Locale('fr'),
            const Locale('pt'),
            const Locale('es'),
          ],
          locale: appLocale,
         theme: appTheme,
          home: LoginNavigator(),
          routes: PageRoutes().routes(),
        );
      },
    );
  }
}

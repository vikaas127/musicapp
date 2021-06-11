import 'package:flutter/material.dart';
import 'package:musicvic/Auth/SignUp/UI/signup_ui.dart';
import 'package:musicvic/Auth/Verification/UI/verification_page.dart';
import 'package:musicvic/Pages/choose_artist.dart';
import 'package:musicvic/Pages/music_language.dart';
import 'package:musicvic/Routes/routes.dart';
import 'Login/UI/login_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
  static const String chooseMusicLanguage = 'login/chooseMusicLanguage';
  static const String chooseArtists = 'login/chooseArtists';
}

class LoginNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState.canPop();
        if (canPop) {
          navigatorKey.currentState.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.loginRoot,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              builder = (BuildContext _) => LoginPage();
              break;
            case LoginRoutes.registration:
              builder = (BuildContext _) => SignUpUI();
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage();
              break;
            case LoginRoutes.chooseMusicLanguage:
              builder = (BuildContext _) => ChooseMusicLanguage();
              break;
            case LoginRoutes.chooseArtists:
              builder = (BuildContext _) => ChooseArtist(() =>
                  Navigator.popAndPushNamed(context, PageRoutes.bottomNavigation));
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}

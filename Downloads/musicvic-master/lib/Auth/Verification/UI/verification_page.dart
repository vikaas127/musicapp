import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicvic/Auth/Verification/UI/verification_interactor.dart';
import 'package:musicvic/Auth/Verification/UI/verification_ui.dart';
import 'package:musicvic/Auth/login_navigator.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    implements VerificationInteractor {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void verify() {
    Navigator.pushNamed(context, LoginRoutes.chooseMusicLanguage);
  }
}

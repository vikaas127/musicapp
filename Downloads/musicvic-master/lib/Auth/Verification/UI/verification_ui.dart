import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicvic/Auth/Verification/UI/verification_interactor.dart';
import 'package:musicvic/BottomNavigation/bottom_navigation.dart';
import 'package:musicvic/Components/background_image.dart';
import 'package:musicvic/Components/continue_button.dart';
import 'package:musicvic/Components/entry_field.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Theme/colors.dart';
import 'package:musicvic/core/services/auth_service.dart';

import '../../login_navigator.dart';

class VerificationUI extends StatefulWidget {
final email;
  const VerificationUI({ Key key, @required this.email}): super(key: key);
  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  final TextEditingController _otpController = TextEditingController();
  AuthService authService = Get.put(AuthService());
  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            title: Text(
              locale.verification,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: Form(
            key: _formKey,
            child: FadedSlideAnimation(
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        locale.add6DigitPhoneNumber,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 20, letterSpacing: 0.5),
                      ),
                    ),
                    SizedBox(height: 40),
    TextFormField(
   // keyboardType: TextInputType.phone,
   // controller: _phoneController,
    decoration: InputDecoration(
    hintText: locale.enterVerificationCode,
    prefixIcon: Icon(
    Icons.phone,
    color: Theme.of(context).highlightColor,
    ),
    fillColor: Colors.grey,
    focusColor: Colors.grey
    ),
    validator: (value) {
    if (value.isEmpty) {
    return 'Enter PIN';
    }
    return null;
    },

                      controller: _otpController,
                    //  noBorder: false,
                     // hint: locale.enterVerificationCode,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: ContinueButton(
                        () {
    if (_formKey.currentState.validate()) {
      authService.verify(widget.email, _otpController.text,).then((
          value) {
        var response = jsonDecode(value.body);
        if (response['status'] == true) {
          Get.snackbar("Success", response['msg']);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
          );
          // widget.verificationInteractor.verify();
        } else {
          Get.snackbar("Error", response['msg']);
        }
      });

      //    widget.verificationInteractor.verify();
    }   },
                        text: locale.submit,
                      ),
                    ),
                  ],
                ),
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ),
        ),
      ],
    );
  }
}

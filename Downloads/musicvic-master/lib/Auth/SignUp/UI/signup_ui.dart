import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicvic/Auth/Login/UI/login_ui.dart';
import 'package:musicvic/Auth/Verification/UI/verification_ui.dart';
import 'package:musicvic/Components/background_image.dart';
import 'package:musicvic/Components/button_with_icon.dart';
import 'package:musicvic/Components/continue_button.dart';
import 'package:musicvic/Components/entry_field.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/Theme/colors.dart';
import 'package:musicvic/core/services/auth_service.dart';
import '../../login_navigator.dart';

class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  AuthService authService = Get.put(AuthService());
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            title: Text(
              locale.signUp,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body:Form(
            autovalidateMode:
            AutovalidateMode.always,
    key: _formKey,
            child: FadedSlideAnimation(
            SingleChildScrollView(
              child: Container(
                height: size.height - 2 * AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical,
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    Image.asset('assets/logo.png', height: 50),
                    Spacer(flex: 2),
                    /*
                    EntryField(
                      controller:_nameController ,
                      noBorder: false,
                      hint: locale.fullName,
                      prefix: Icon(
                        Icons.account_circle,
                        color: Theme.of(context).highlightColor,
                      ),
                     // maxLength: 1,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    EntryField(

                      controller: _phoneController,
                      noBorder: false,
                      hint: locale.phoneNumber,
                     // maxLength: 1,
                      prefix: Icon(Icons.phone_iphone,
                          color: Theme.of(context).highlightColor),
                      keyboardType: TextInputType.number,
                    ),*/
                  //  SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: locale.fullName,
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).highlightColor,
                          ),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: InputDecoration(
                          hintText: locale.password,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).highlightColor,
                          ),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter phone';
                        }
                        return null;
                      },
                    ),

                   /* EntryField(
                      controller: _emailController,
                      noBorder: false,
                      hint: locale.emailAddress,
                     // maxLength: 1,
                      prefix: Icon(Icons.email,
                          color: Theme.of(context).highlightColor),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    EntryField(
                      controller: _passwordController,
                      noBorder: false,
                      hint: locale.password,
                     // maxLength: 1,
                      prefix: Icon(Icons.lock,
                          color: Theme.of(context).highlightColor),
                      keyboardType: TextInputType.visiblePassword,
                    ),*/
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: locale.emailAddress,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).highlightColor,
                          ),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: locale.password,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).highlightColor,
                          ),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                    ),

                //    SizedBox(height: 16),

                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: ContinueButton(
                        () { if (_formKey.currentState.validate()) {
                          authService.createAccount(_nameController.text, _emailController.text,_passwordController.text, _phoneController.text,).then((value) {
                     var  response = jsonDecode(value.body);

                            if (response['status'] == true) {

                              Get.snackbar("Success", response['msg'].toString());
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VerificationUI()),
                              );
                            } else {
                              Get.snackbar("Error", response['msg'].toString());
                            //  Get.snackbar("Error", "Alredy Account");
                            }
                          });

                        }}
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell
                        (
                        onTap: (){
                          Navigator.popAndPushNamed(context, LoginRoutes.loginRoot);

                       //   widget.loginInteractor.loginWithemail('+91', '9742364878');

                        },
                        child: Text(
                          "Already Have Account? Login ",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        locale.orContinueWith,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //Facebook button
                        ButtonWithIcon(
                          label: locale.facebook,
                          color: Color(0xff3a559e),
                          image: 'assets/ic_fb.png',
                          onTap: () {
                            Navigator.pushNamed(
                                context, LoginRoutes.verification);
                          },
                        ),
                        SizedBox(width: 20),
                        //Google button
                        ButtonWithIcon(
                          label: locale.google,
                          textColor: Theme.of(context).disabledColor,
                          color: Colors.white,
                          image: 'assets/ic_ggl.png',
                          onTap: () {
                            Navigator.pushNamed(
                                context, LoginRoutes.verification);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),),
      ],
    );
  }
}

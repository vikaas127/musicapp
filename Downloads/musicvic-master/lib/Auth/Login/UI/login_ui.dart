import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:musicvic/BottomNavigation/bottom_navigation.dart';
import 'package:musicvic/Components/background_image.dart';
import 'package:musicvic/Components/button_with_icon.dart';
import 'package:musicvic/Components/continue_button.dart';
import 'package:musicvic/Components/entry_field.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/Theme/colors.dart';
import 'package:musicvic/core/services/auth_service.dart';
import '../../login_navigator.dart';
import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  AuthService authService = Get.put(AuthService());
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  String isoCode;

  @override
  void dispose() {
    _controller.dispose();
    _numberController.dispose();
    super.dispose();
  }
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
              locale.signIn,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            actions: [
              FlatButton(
                child: Text(
                  locale.skip,
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body:Form(
key: _formKey,
            child:
    FadedSlideAnimation(
            SingleChildScrollView(
              child: Container(
                height: size.height -
                    2 * AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical,
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Spacer(),
                    Image.asset('assets/logo.png', height: 100),
                    Spacer(flex: 3),
                  /*  EntryField(
                      noBorder: false,
                      controller: _controller,
                      keyboardType: TextInputType.text,
                      readOnly: false,
                      hint: locale.selectCountry,
                  //    maxLength: 1,
                      prefix: Icon(
                       Icons.language,
                        color: Theme.of(context).highlightColor,
                      ),
                    ),*/
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
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
                 /*   EntryField(

                       controller: _emailController,
                      noBorder: false,
                      keyboardType: TextInputType.emailAddress,
                      readOnly: false,
                      hint: locale.emailAddress,
                     // maxLength: 1,
                      prefix: Icon(
                        Icons.email,
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    EntryField(

                      controller: _passwordController,
                      noBorder: false,
                      keyboardType: TextInputType.visiblePassword,
                      readOnly: false,
                      hint: locale.password,
                      //maxLength: 1,
                      prefix: Icon(
                        Icons.lock,
                        color: Theme.of(context).highlightColor,
                      ),
                    ),*/
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child:
                      ContinueButton(() {
    if (_formKey.currentState.validate()) {
                        authService.login(_emailController.text,_passwordController.text,).then((value) {
                      var response= jsonDecode(value.body);
                       print(value.body.toString());
                       print(value.statusCode);
                          if (response['status'] == true) {
                            Get.snackbar("Succes", response['msg']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavigation()),
                            );
                           // Navigator.popAndPushNamed(context, PageRoutes.bottomNavigation);
                          //  widget.loginInteractor.loginWithemail('+91', '9742364878');

                          } else {
                            Get.snackbar("Error", response['msg']);
                          }
                        });
                       // authService.login("vikas090497@gmail.com", password)


                      }}),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell
                        (
                        onTap: (){

                          widget.loginInteractor.loginWithemail('+91', '9742364878');

                        },
                        child: Text(
                          "Don't Have Account? Create ",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                      ),
                    ),
                    Spacer(),

                    Text(
                      locale.orContinueWith,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //Facebook button
                        ButtonWithIcon(
                          label: locale.facebook,
                          color: Color(0xff3a559e),
                          image: 'assets/ic_fb.png',
                          onTap: () {
                            widget.loginInteractor
                                .loginWithemail('+91', '9742364878');
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
                            widget.loginInteractor
                                .loginWithemail('+91', '9742364878');
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

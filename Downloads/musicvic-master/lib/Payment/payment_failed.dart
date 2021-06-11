import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:musicvic/Components/continue_button.dart';
import 'package:musicvic/Locale/locale.dart';

class PaymentFailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              FadedScaleAnimation(
                Image.asset(
                  'assets/Payment failed.png',
                  height: screenWidth / 1.7,
                  width: screenWidth / 1.5,
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  locale.oops + ' !!',
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
              Center(
                child: Text(
                  '\n' + locale.paymentFailed,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                locale.somethingWentWrong + '\n' + locale.pleaseTryAgain,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 14),
              ),
              Spacer(
                flex: 3,
              ),
              ContinueButton(
                () {
                  Phoenix.rebirth(context);
                },
                text: 'Try Again',
              )
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

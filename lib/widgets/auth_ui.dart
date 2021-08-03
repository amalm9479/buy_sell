import 'package:buy_sell/screens/authentication/phoneauth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class AuthUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, PhoneAuthScreen.id);
                },
                child: Row(
                  children: [
                    Icon(Icons.phone_android_outlined, color: Colors.black),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'continue with phone',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ),
          SignInButton(
            Buttons.Google,
            text: ('continue with google'),
            onPressed: () {},
          ),
          SignInButton(
            Buttons.FacebookNew,
            text: ('continue with facebook '),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OR",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Login with Email",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}

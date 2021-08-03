import 'package:buy_sell/widgets/auth_ui.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/cart1.png",
                      height: 320,
                      width: 350,
                      color: Colors.lightBlueAccent.shade700,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "buy or sell",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.cyan.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(child: AuthUi()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "if you continue, you are accepting\n Terms and conditions and Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool validate = false;

  var countryCodeController = TextEditingController(text: '+965');
  var phoneNumberController = TextEditingController();

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
          SizedBox(
            width: 8,
          ),
          Text('Please wait')
        ],
      ),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  phonAuthentication(number) {
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40,
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red.shade900,
            child: Icon(
              CupertinoIcons.person_alt_circle,
              color: Colors.red,
              size: 60,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'enter your Phone',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'we will send confirmation code to your phone',
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: countryCodeController,
                  enabled: false,
                  decoration:
                      InputDecoration(counterText: '00', labelText: 'Country'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 8) {
                      setState(() {
                        validate = true;
                      });
                    }
                    if (value.length < 8) {
                      setState(() {
                        validate = false;
                      });
                    }
                  },
                  autofocus: true,
                  maxLength: 8,
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      labelText: 'number',
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(fontSize: 10, color: Colors.grey)),
                ),
              )
            ],
          )
        ]),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AbsorbPointer(
            absorbing: validate ? false : true,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: validate
                    ? MaterialStateProperty.all(Theme.of(context).primaryColor)
                    : MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: () {
                String number =
                    '${countryCodeController.text}${phoneNumberController.text}';
                showAlertDialog(context);
                phonAuthentication(number);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

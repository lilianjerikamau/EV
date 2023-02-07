import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/start_screen.dart';
import 'package:ev_app/screens/welcome_back_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/auth_service.dart';
class ForgotPasswordScreenTwo extends StatefulWidget {
  final String email;

  const ForgotPasswordScreenTwo({Key? key,required this.email}) : super(key: key);

  @override
  State<ForgotPasswordScreenTwo> createState() =>
      _ForgotPasswordScreenTwoState();

}

class _ForgotPasswordScreenTwoState extends State<ForgotPasswordScreenTwo> {
  var items = [
    'LPG propelled',
    'LPG/liquid fuel',
    'electric/liquid fuel(hybrid)',
    'Fuel-petrol',
    'Fuel-disel',
  ];

  late bool _passwordVisible;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
 String? _otp;

  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.green),
        ),
        iconTheme: IconThemeData(color: Colors.green),
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: LinearProgressIndicator(
            backgroundColor: Colors.green.withOpacity(0.3),
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
            value: 0.5,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter the OTP code sent to ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpInput(_fieldOne, true), // auto focus
                        OtpInput(_fieldTwo, false),
                        OtpInput(_fieldThree, false),
                        OtpInput(_fieldFour, false),
                        OtpInput(_fieldFive, false),
                        OtpInput(_fieldSix, false),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Did not receive the code ? Resend code',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Confirm Code   >',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        _otp = _fieldOne.text +
                            _fieldTwo.text +
                            _fieldThree.text +
                            _fieldFour.text+
                            _fieldFive.text+
                            _fieldSix.text;

                      });
                      AuthenticationServices(context)
                          .validateOTP(widget.email,_otp!)
                          .then((value) async => {
                        if (value.status != "success")
                          {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(value.message),
                              duration: Duration(seconds: 3),
                            ))
                          }
                        else
                          {
                            ScaffoldMessenger.of(context)
                                .showSnackBar( SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(value.message),
                              duration: Duration(seconds: 3),
                            )),
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SetNewPassword(otp: _otp!,email: widget.email,)),
                            )
                          }
                      });
                      print(nameController.text);
                      print(passwordController.text);

                    },
                  )),
              SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 50,
        width: 60,
        child: TextField(
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}

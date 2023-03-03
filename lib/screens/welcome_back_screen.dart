import 'package:ev_app/screens/forgot_password_screen.dart';
import 'package:ev_app/screens/home_screen.dart';
import 'package:ev_app/screens/personal_details_screen.dart';
import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/start_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/auth_service.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
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
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: TextStyle(color: Color(0xFF75A843)),
          ),
          iconTheme: IconThemeData(color: Color(0xFF75A843)),
          leading: Builder(
            builder: (BuildContext context) {
              return RotatedBox(
                quarterTurns: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF75A843),
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
              backgroundColor: Color(0xFF75A843).withOpacity(0.3),
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF75A843)),
              value: 0.5,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/smallcar.png'),
                      SizedBox(
                        height: 15,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Welcome Back\n\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF75A843),
                              fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              //"${comment.data()['comment']}"
                              text: 'Sign in to proceed',

                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color(0xFF75A843),
                    width: 1,
                  )),
                  padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'G  ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF75A843),
                              fontSize: 17),
                          children: <TextSpan>[
                            TextSpan(
                              //"${comment.data()['comment']}"
                              text: 'Sign up with google',

                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF75A843)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Email address",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Color(0xFF75A843)),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            // hintText: 'User Name',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Password",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Color(0xFF75A843)),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            // hintText: 'User Name',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()),
                    );
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF75A843),
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
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
                        'Sign In   >',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        ProgressDialog dial = new ProgressDialog(context,
                            type: ProgressDialogType.Normal);
                        String password = passwordController.text.trim();
                        String username = nameController.text.trim();
                        dial.show();
                        dial.style(
                          progressWidget: Container(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator()),
                          backgroundColor: Colors.white,
                          messageTextStyle: TextStyle(
                              color: Color(0xFF75A843),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold),
                          message: 'Please wait',
                        );
                          AuthenticationServices(context)
                              .login(username, password)
                              .then((value) async =>
                          {
                            if (value.error!=null)
                              {
                                dial.hide(),
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(value.error_description),
                                  duration: Duration(seconds: 3),
                                ))
                              }
                            else
                              {
                                dial.hide(),
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text("Login successful"),
                                  duration: Duration(seconds: 3),
                                )),
                                await AuthenticationServices(context)
                                    .saveUser(value),  // await AuthenticationServices(context)

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ))
                              }
                          });


                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonalDetailsScreen()),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          //"${comment.data()['comment']}"
                          text: 'Create Account',

                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF75A843),
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            )),
      ),
    );
  }
}

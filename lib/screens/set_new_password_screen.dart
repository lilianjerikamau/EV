import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/start_screen.dart';
import 'package:ev_app/screens/welcome_back_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/auth_service.dart';

class SetNewPassword extends StatefulWidget {
  final String email;
  final String otp;
  const SetNewPassword({Key? key,required this.otp,required this.email}) : super(key: key);

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  var items = [
    'LPG propelled',
    'LPG/liquid fuel',
    'electric/liquid fuel(hybrid)',
    'Fuel-petrol',
    'Fuel-disel',
  ];
  late bool _passwordVisible;
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set new password',
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
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Enter new password",
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
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Confirm new password",
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
                      controller: confirmPasswordController,
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
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Register Account   >',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      String confirm = confirmPasswordController.text.trim();
                      String password = passwordController.text.trim();
                      if(password.isNotEmpty ){
                        if(confirm.isNotEmpty){
                      if(password == confirm) {
                        AuthenticationServices(context)
                            .resetPassword(
                            widget.email, widget.otp, password)
                            .then((value) async =>
                        {
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
                                  .showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(value.message),
                                duration: Duration(seconds: 3),
                              )),
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WelcomeBackScreen()),
                              )
                            }
                        });
                      }else{
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text("Passwords do not match"),
                          duration: Duration(seconds: 3),
                        ));
                      }}else{
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text("Confirm password cannot be empty"),
                            duration: Duration(seconds: 3),
                          ));
                        }
                        }else{
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text("Password cannot be empty"),
                          duration: Duration(seconds: 3),
                        ));
                      }


                    }
                  )),
              SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }
}

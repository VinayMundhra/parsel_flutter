import 'package:flutter/material.dart';
import 'package:parsel_flutter/screens/dashboard.dart';

import '../utils/colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: blueColor,
          body: SingleChildScrollView(
              child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child: Container(
                        width: 100,
                        height: 50,
                        child: Image.asset('assets/parsellogo.png')),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'PARSEL',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white, letterSpacing: 5),
                ),
                Text(
                  'TAP TO DELIVER',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                          // color: Color.fromARGB(255, 68, 162, 239),
                        ),
                        hintText: 'Email or Phone Number',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                        focusColor: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Your email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10, bottom: 25),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                          // color: Color.fromARGB(255, 68, 162, 239),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                        focusColor: Colors.grey),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Your password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const DashBoardScreen()));
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const Text(
                        'Forgot ?',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Help',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                              maxRadius: 10,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.question_mark_rounded,
                                size: 20,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 50,
                //   width: 250,
                //   decoration: BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: BorderRadius.circular(20)),
                //   // child: FlatButton(
                //   //   onPressed: () {
                //   //     Navigator.push(
                //   //         context, MaterialPageRoute(builder: (_) => HomePage()));
                //   //   },
                //   //   child: Text(
                //   //     'Login',
                //   //     style: TextStyle(color: Colors.white, fontSize: 25),
                //   //   ),
                //   // ),
                // ),
              ],
            ),
          ))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: HexColor('#202020'),
                foregroundColor:
                    HexColor('#FFFFFF') //here you can give the text color
                ),
            primarySwatch: Colors.grey,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: HexColor('#0137FF')))),
        home: SignupScreen());
  }
}

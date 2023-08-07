import 'package:flutter/material.dart';
import 'screens/adminPanel.dart';
import 'screens/gestionAdmin.dart';
import 'screens/inicioAdmin.dart';
import 'screens/first_screen.dart';
import 'screens/fourth_screen.dart';
import 'screens/home_login.dart';
import 'screens/second_screen.dart';
import 'screens/login.dart';

import 'config/palette.dart';
import 'screens/third_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survay app',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        primaryColor: Colors.grey[900],
        //hintColor: Colors.red,
      ),
      home: const FirstScreen(),
      routes: {
        '/first-screen': (context) => const FirstScreen(),
        'login': (context) => loginPage(),
        'home-login': (context) => loginHomeState(),
        'second-screen': (context) => SurveyPageState(),
        '/third-screen': (context) => Survey2PageState(),
        '/fourth-screen': (context) => Survey3PageState(),
        'inicioAdmin': (context) => inicioAdmin(),
        'adminPanel': (context) => AddUserForm(),
        'gestionAdmin': (context) => UserList(),
      },
    );
  }
}

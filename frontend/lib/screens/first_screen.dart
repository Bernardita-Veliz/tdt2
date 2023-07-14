import 'package:flutter/material.dart';
import 'home_login.dart';
//import 'login.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/first-screen';
  const FirstScreen({super.key});
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey app'),
        //backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenido alumn@',
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          loginHomeState()), //despues cambiar a loginPage
                );
              },
              child: const Text(
                'Iniciar',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 16),
            /*TextButton(
              onPressed: () {
                // Agregar código para cerrar sesión aquí
              },
              child: const Text('Cerrar sesión'),
            ),*/
          ],
        ),
      ),
    );
  }
}

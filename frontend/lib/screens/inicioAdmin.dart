import 'package:flutter/material.dart';

import 'adminPanel.dart';
import 'gestionAdmin.dart';

class inicioAdmin extends StatefulWidget {
  static const routeName = '/inicioAdmin';
  @override
  _inicioAdminState createState() => _inicioAdminState();
}

class _inicioAdminState extends State<inicioAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey app'),
        //backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          inicioAdmin()), //despues cambiar a loginPage
                );
              },
            ),
            ListTile(
              title: const Text('Gestión de Usuarios'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserList()),
                );
                // Aquí puedes agregar la lógica para redirigir a la vista de gestión de usuarios
              },
            ),
            ListTile(
              title: const Text('Nuevo Usuarios'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPanel()),
                );
                // Aquí puedes agregar la lógica para redirigir a la vista de gestión de usuarios
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido Administrador',
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

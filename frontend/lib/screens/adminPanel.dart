import 'package:flutter/material.dart';
import 'inicioAdmin.dart';
import 'gestionAdmin.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración'),
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
                  MaterialPageRoute(
                      builder: (context) =>
                          UserList()), //despues cambiar a loginPage
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: AddUserForm(),
        ),
      ),
    );
  }
}

class AddUserForm extends StatefulWidget {
  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Agregar Usuario',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _firstNameController,
          decoration: const InputDecoration(
            labelText: 'Nombre',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _lastNameController,
          decoration: const InputDecoration(
            labelText: 'Apellido',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Correo Electrónico',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            labelText: 'Contraseña',
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            // Obtener los valores de los controladores
            //String firstName = _firstNameController.text;
            //String lastName = _lastNameController.text;
            //String email = _emailController.text;
            //String password = _passwordController.text;

            // Realizar las operaciones necesarias con los datos del nuevo usuario
            // ...

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Usuario Agregado'),
                  content:
                      const Text('El usuario ha sido agregado correctamente.'),
                  actions: [
                    TextButton(
                      child: const Text('Aceptar'),
                      onPressed: () {
                        // Lógica adicional después de agregar el usuario
                        // ...
                        _firstNameController.clear();
                        _lastNameController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                        _idController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _idController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panel de Administración',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPanel(),
    );
  }
}

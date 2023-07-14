import 'package:flutter/material.dart';
import 'inicioAdmin.dart';
import 'adminPanel.dart';

void main() {
  runApp(MyApp());
}

class UserList extends StatefulWidget {
  static const routeName = 'gestionAdmin';
  @override
  _UserListState createState() => _UserListState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Usuarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserList(),
    );
  }
}

class _UserListState extends State<UserList> {
  final List<Map<String, dynamic>> users = [
    {
      'id': 1,
      'first_name': 'John',
      'last_name': 'Doe',
      'email': 'john.doe@example.com',
      'password': 'password123',
    },
    {
      'id': 2,
      'first_name': 'Jane',
      'last_name': 'Smith',
      'email': 'jane.smith@example.com',
      'password': 'password456',
    },
    // Agrega más usuarios según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
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
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return ListTile(
            title: Text('${user['first_name']} ${user['last_name']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${user['id']}'),
                Text('Email: ${user['email']}'),
                Text('Password: ${user['password']}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Lógica para editar el usuario
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Editar Usuario'),
                          content: Text(
                              'Editar usuario: ${user['first_name']} ${user['last_name']}'),
                          actions: [
                            TextButton(
                              child: const Text('Guardar'),
                              onPressed: () {
                                // Lógica para guardar los cambios
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Lógica para borrar el usuario
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Borrar Usuario'),
                          content: Text(
                              '¿Estás seguro de que quieres borrar al usuario ${user['first_name']} ${user['last_name']}?'),
                          actions: [
                            TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Borrar'),
                              onPressed: () {
                                // Lógica para borrar el usuario
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

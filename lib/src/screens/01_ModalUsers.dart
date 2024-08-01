import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/controllers/Users.dart';
import 'package:http/http.dart' as http;

void ModalConsultarUsuarios(BuildContext context) {
  consultUsers().then((consultarUsuarios) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.event),
                  ),
                ],
                backgroundColor: Colors.red[100],
                title: Text("Usuarios"),
              ),
              body: ListView.builder(
                itemCount: consultarUsuarios.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(consultarUsuarios[index].name),
                    subtitle: Text(consultarUsuarios[index].email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.update,
                            color: Colors.purple[300],
                          ),
                          onPressed: () {
                            _showActualizarUsuario(
                              context,
                              consultarUsuarios[index],
                              () {
                                setState(() {
                                  consultUsers().then((newUsers) {
                                    consultarUsuarios = newUsers;
                                  });
                                });
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _showEliminarUsuario(
                              context, 
                              consultarUsuarios[index].id, 
                              () {
                                deleteUsers(consultarUsuarios[index].id).then((value) {
                                  setState(() {
                                    consultarUsuarios.removeAt(index);
                                  });
                                }).catchError((error) {
                                  print("Error al eliminar usuario: $error");
                                });
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
          },
        );
      },
    );
  });
}

void _showEliminarUsuario(BuildContext context, String userId, VoidCallback onDeleteConfirmed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmar eliminación"),
        content: Text("¿Está seguro de que desea eliminar este usuario?"),
        actions: [
          TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Eliminar"),
            onPressed: () {
              Navigator.of(context).pop();
              onDeleteConfirmed();
            },
          ),
        ],
      );
    },
  );
}

void _showActualizarUsuario(BuildContext context, Users user, VoidCallback onUserUpdated) {
  TextEditingController nameController = TextEditingController(text: user.name);
  TextEditingController emailController = TextEditingController(text: user.email);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Actualizar usuario"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Actualizar"),
            onPressed: () {
              String name = nameController.text;
              String email = emailController.text;

              if (name.isNotEmpty && email.isNotEmpty) {
                updateUser(user.id, name, email).then((updatedUser) {
                  Navigator.of(context).pop(); 
                  onUserUpdated(); 
                }).catchError((error) {
                  print("Error al actualizar usuario: $error");
                  Navigator.of(context).pop(); 
                });
              } else {
                print("Error: Los campos no pueden estar vacíos");
              }
            },
          ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/controllers/Users.dart';


ModalUsuario(BuildContext context) {
  // final consultaUsuarios = consultausuarios();
//  print(consultaUsuarios);

  consultUsers().then((consultausuarios) {
    // print(consultausuarios[1].name);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(padding: EdgeInsets.all(8), child: Icon(Icons.event)),
              ],
              backgroundColor: Colors.red[100],
              title: Text("Usuarios"),
            ),
            body: ListView.builder(
              itemCount: consultausuarios.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(consultausuarios[index].name));
              },
            ),
          );
        });
  });
}
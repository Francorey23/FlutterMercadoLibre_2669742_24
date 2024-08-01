import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/screens/01_ModalUsers.dart';

class AdminUsers extends StatefulWidget {
  const AdminUsers({super.key});

  @override
  State<AdminUsers> createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/principal');
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          "Administrar usuarios",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            "https://cdn-icons-png.flaticon.com/512/1535/1535024.png",
            width: 300,
            height: 300,
          ),
          SizedBox(height: 16.0),
          Card(
            child: ListTile(
              title: Text("Buscar usuario"),
              leading: Icon(Icons.person_2_outlined),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {},
            ),
          ),
          SizedBox(height: 8.0),
          Card(
            child: ListTile(
              title: Text("Usuarios"),
              leading: Icon(Icons.connect_without_contact_rounded),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                ModalConsultarUsuarios(context);
              },
            ),
          ),
          SizedBox(height: 8.0),
          Card(
            child: ListTile(
              title: Text("Solicitudes"),
              leading: Icon(Icons.connect_without_contact_rounded),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {},
            ),
          ),
          SizedBox(height: 8.0),
          Card(
            child: ListTile(
              title: Text("Informes"),
              leading: Icon(Icons.connect_without_contact_rounded),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

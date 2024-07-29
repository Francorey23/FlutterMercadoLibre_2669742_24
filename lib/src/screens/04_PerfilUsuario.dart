import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          "Perfil",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("http://imagen.jpg"),
              ),
              SizedBox(height: 10),
              Text(
                "Mario Benedetti",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "@benedetti",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: 30),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person_2_outlined,
                      color: Colors.blue,
                    ),
                    title: Text("Genero"),
                    trailing: Text("Femenino"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.cake, color: Colors.blue),
                    title: Text("Cumpleaños"),
                    trailing: Text("12-2-2000"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue),
                    title: Text("Numero de telefono"),
                    trailing: Text("310 - 2345678"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.blue),
                    title: Text("Cambiar password"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

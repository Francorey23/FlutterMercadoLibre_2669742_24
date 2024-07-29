import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/screens/05_MenuPrincipal.dart';
import 'package:http/http.dart' as http;

class PaginadeInicio extends StatefulWidget {
  const PaginadeInicio({super.key});

  @override
  State<PaginadeInicio> createState() => _PaginadeInicioState();
}

class _PaginadeInicioState extends State<PaginadeInicio> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;
  Future<void> _login() async {
    setState(() {
      _isloading = true;
    });
    final responselogin = await http.post(
        // Uri.parse("http://10.0.2.2:9000/auth/login"),
        Uri.parse("https://apirestnodeexpressmongodb.onrender.com/auth/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": _emailController.text,
          "password": _passwordController.text,
        }));
    setState(() {
      _isloading = false;
    });
    //manejar la respuesta
    /*   if (responselogin.statusCode == 200) {
      final responsebody = jsonDecode(responselogin.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("login exitoso")),
      ); */
    if (responselogin.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("password o email incorrectos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                width: 100,
                height: 100,
              ),
              SizedBox(height: 16.0),
              Text(
                "Bienvenido a Mercado Libre Col",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                "Iniciar sesión para continuar..",
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Digita Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isloading ? null : _login,
                  child: _isloading
                      ? CircularProgressIndicator()
                      : Text("Iniciar sesión"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "O inicie con ",
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.network(
                    "https://img.freepik.com/fotos-premium/representacion-3d-logotipo-aplicacion-google-sobre-fondo-blanco_41204-8013.jpg",
                    height: 41,
                    width: 41,
                  ),
                  label: Text("Logeate con Google"),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.network(
                    "https://img.freepik.com/fotos-premium/representacion-3d-logotipo-aplicacion-google-sobre-fondo-blanco_41204-8013.jpg",
                    height: 41,
                    width: 41,
                  ),
                  label: Text("Logeate con Facebook"),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Olvido su password",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
                child: Text(
                  "No tiene una cuenta? Registrarse",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

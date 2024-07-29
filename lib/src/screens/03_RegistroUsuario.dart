import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/controllers/Users.dart';


class PaginadeRegistro extends StatefulWidget {
  const PaginadeRegistro({super.key});

  @override
  State<PaginadeRegistro> createState() => _PaginadeRegistroState();
}

class _PaginadeRegistroState extends State<PaginadeRegistro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<Users>? _futureUsers;

 /*  void _clearControllers() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  void _navigateToLogin() {
    Navigator.pushNamed(context, '/inicio');
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 16.0),
                    Text(/*  */
                      "Ir a registrarse..",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Crear una nueva cuenta",
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Nombre completo",
                        prefixIcon: Icon(Icons.person_3_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese nombre completo";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "recordar password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _futureUsers = createUsers(
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text,
                              );
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Registro exitoso')),
                            );
                           
                          }
                        },
                        child: Text("Registrarse"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Tienes una cuenta?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/inicio');
                          },
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

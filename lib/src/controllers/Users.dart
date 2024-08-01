import 'dart:convert';
import 'package:http/http.dart' as http;


// Inicio de sesión usuario

 /*  Future<http.Response> _sendLoginRequest(String email, String password) async {
    return await http.post(
      Uri.parse("https://apirestnodeexpressmongodb.onrender.com/auth/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );
  } */

 import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> sendLoginRequest(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse("https://apirestnodeexpressmongodb.onrender.com/auth/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    return response;
  } catch (e) {
    // Maneja el error de red o cualquier otro error
    print("Error durante la solicitud de inicio de sesión: $e");
    return http.Response('{"error": "Error en la solicitud"}', 500);
  }
}



//1. Registrar usuarios

Future<Users> createUsers(String name, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{"name": name, "email": email, "password": password}),
  );

  if (response.statusCode == 201) {
    return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('No es posible registrarse');
  }
}

class Users {
  final String _id;
  final name;
  final email;

  const Users({
    required String id,
    required this.name,
    required this.email,
  }): _id = id;
  
//metodo utilizado para limpiar los objetos
  Users.empty()
      : _id = '',
        name = '',
        email = '';

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }
  // Método getter para obtener _id
  String get id => _id;
}

//2. Consultar usuarios
//1. Hacer una solicitud de red usando el método get
Future<List<Users>> consultUsers() async {
  final response = await http.get(
      Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load jewelry products'); 
  }
}


/////////////////////////////////////////////
/// 3. eliminar un usuario

Future<Users> deleteUsers(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Users.empty();
  } else {
    throw Exception('Failed to delete album.');
  }
}

//4. Actualizar un usuario
Future<Users> updateUser(String id, String name, String email) async {
  final response = await http.put(
    Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "name": name,
      "email": email,
    }),
  );

  if (response.statusCode == 200) {
    return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to update user');
  }
}
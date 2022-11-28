import 'package:flutter/material.dart';
import 'package:reto3/autenticacion/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final email = TextEditingController();
final password = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro / Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
                image: NetworkImage(
                    "https://www.pngall.com/wp-content/uploads/2016/04/Chat-Free-Download-PNG.png")),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: "Email", suffixIcon: Icon(Icons.email)),
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  hintText: "Password", suffixIcon: Icon(Icons.key)),
            ),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion().IniciarSesion(
                      email: email.text, password: password.text);
                },
                icon: Icon(Icons.login_rounded),
                label: Text("Iniciar Sesion")),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion()
                      .CrearUsuario(email: email.text, password: password.text);
                },
                icon: Icon(Icons.person_add_alt_rounded),
                label: Text("Registrarse"))
          ],
        ),
      ),
    );
  }
}

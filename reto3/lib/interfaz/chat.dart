import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reto3/autenticacion/autenticacion.dart';
import 'package:reto3/interfaz/mensajes.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              (Autenticacion().usuarios?.email).toString(),
              style: TextStyle(fontSize: 17),
            ),
            VerticalDivider(),
            VerticalDivider(),
            IconButton(
                onPressed: () {
                  Autenticacion().CerrarSesion();
                },
                icon: Icon(Icons.logout)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Expanded(child: mensajes()),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Card(
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: mensaje,
                        focusNode: myFocusNode,
                        decoration: InputDecoration(hintText: " Mensaje"),
                        onSubmitted: (valor) {
                          mensaje.text = valor;
                          if (mensaje.text.isNotEmpty) {
                            myFocusNode.requestFocus();
                            fire.collection("Chat").doc().set({
                              "mensaje": mensaje.text,
                              "time": DateTime.now(),
                              "email":
                                  (Autenticacion().usuarios?.email).toString()
                            });
                            mensaje.clear();
                          }
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (mensaje.text.isNotEmpty) {
                            myFocusNode.requestFocus();
                            fire.collection("Chat").doc().set({
                              "mensaje": mensaje.text,
                              "time": DateTime.now(),
                              "email":
                                  (Autenticacion().usuarios?.email).toString()
                            });
                            mensaje.clear();
                          }
                        },
                        icon: Icon(Icons.send_sharp))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

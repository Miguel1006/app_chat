import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto3/autenticacion/autenticacion.dart';

import 'package:reto3/interfaz/login.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("time", descending: false)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: resp_consulta,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return respuesta.data?.docs.isEmpty == false
              ? ListView.builder(
                  itemCount: respuesta.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: (Autenticacion().usuarios?.email).toString() ==
                              respuesta.data!.docs[index].get("email")
                          ? Colors.greenAccent[200]
                          : Colors.blueAccent[100],
                      child: ListTile(
                        title: Text(
                          respuesta.data!.docs[index].get("mensaje"),
                          textAlign:
                              (Autenticacion().usuarios?.email).toString() ==
                                      respuesta.data!.docs[index].get("email")
                                  ? TextAlign.right
                                  : TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(respuesta.data!.docs[index].get("email"),
                            textAlign:
                                (Autenticacion().usuarios?.email).toString() ==
                                        respuesta.data!.docs[index].get("email")
                                    ? TextAlign.right
                                    : TextAlign.left),
                      ),
                    );
                  },
                )
              : Center(
                  child: Column(
                  children: [
                    Text("Por favor espere.."),
                    CircularProgressIndicator()
                  ],
                ));
        });
  }
}

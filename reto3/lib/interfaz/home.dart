import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto3/autenticacion/autenticacion.dart';

import 'package:reto3/interfaz/chat.dart';
import 'package:reto3/interfaz/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat Prada',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Prada Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Autenticacion().estadoAutenticacion,
        builder: (context, respuesta) {
          if (respuesta.hasData) {
            return chat();
          } else {
            return login();
          }
        });
  }
}

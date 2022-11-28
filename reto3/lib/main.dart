import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'interfaz/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDy1a9VucNFfGKRhW2pg_QHEwHOkZYQiFs", // Clave de Api web
          appId: "1:351430778235:web:e4765d6e8dbc9c770db1de", // Id de la app
          messagingSenderId: "351430778235", // ID del proyecto
          projectId: "chat-prada"));
  // Numero del proyecto
  runApp(const MyApp());
}

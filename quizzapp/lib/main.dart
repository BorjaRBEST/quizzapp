import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:quizzapp/pages/login_page.dart';
import 'package:quizzapp/providers/auth_provider.dart';
import 'firebase_options.dart'; // Importa el archivo firebase_options.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Usa DefaultFirebaseOptions para inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}

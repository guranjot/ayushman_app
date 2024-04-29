import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './constants/texts.dart';
import 'components/pages/welcome.dart';
import 'firebase_options.dart';

void main() async {
  // Ensure that Firebase is initialized before runApp() is called
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 252, 166, 8)),
        useMaterial3: true,
      ),
      home:  Welcome(),
    );
  }
}

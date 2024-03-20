import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:pc_case_filter/secrets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: myFirebaseOptions
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'機殼篩選',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          scrollbarTheme: ScrollbarThemeData(
            thumbVisibility: MaterialStateProperty.all<bool>(true),
            trackVisibility: MaterialStateProperty.all<bool>(true),
            thickness: MaterialStateProperty.all<double>(10),
            interactive: true,
          )
      ),
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
    );
  }
}

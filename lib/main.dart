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

bool isDarkMode = false;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    isDarkMode = brightness == Brightness.dark;
    return MaterialApp(
      title:'機殼篩選',
      theme: ThemeData(
          cardColor: (isDarkMode? const Color.fromRGBO(43, 45, 48, 1):Colors.white),
          primaryColor: (isDarkMode? const Color.fromRGBO(30, 31, 34, 1):const Color.fromARGB(255, 240, 240, 240)),
          primaryColorDark: (isDarkMode? const Color.fromRGBO(187, 189, 183, 1):const Color.fromRGBO(43, 45, 48, 1)),
          primaryColorLight: (isDarkMode? Colors.white:const Color.fromRGBO(103, 80, 164, 1)),
          focusColor: (isDarkMode? Colors.grey:const Color.fromRGBO(103, 80, 164, 1)),
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

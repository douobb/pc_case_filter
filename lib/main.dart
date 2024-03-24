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

int colorMode = 0;
late bool isDarkMode ;
late Brightness brightness;
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setColorMode(){
    setState(() {
      colorMode = (colorMode + 1) % 3;
    });
  }
  void reset(){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    brightness = MediaQuery.of(context).platformBrightness;
    isDarkMode = (brightness == Brightness.dark && colorMode == 0) || (colorMode == 1);
    return MaterialApp(
      title:'機殼篩選',
      theme: ThemeData(
          cardColor: (isDarkMode? const Color.fromRGBO(43, 45, 48, 1):Colors.white),
          primaryColor: (isDarkMode? const Color.fromRGBO(30, 31, 34, 1):const Color.fromARGB(255, 240, 240, 240)),
          primaryColorDark: (isDarkMode? const Color.fromRGBO(187, 189, 183, 1):const Color.fromRGBO(43, 45, 48, 1)),
          primaryColorLight: (isDarkMode? Colors.white:const Color.fromRGBO(103, 80, 164, 1)),
          focusColor: (isDarkMode? Colors.grey:const Color.fromRGBO(103, 80, 164, 1)),
          dividerColor: (isDarkMode? const Color.fromRGBO(43, 45, 48, 1):const Color.fromRGBO(230, 223, 239, 1)),
          highlightColor: (isDarkMode? const Color.fromRGBO(187, 189, 183, 1):const Color.fromRGBO(154, 137, 194, 1)),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color>((isDarkMode? const Color.fromRGBO(187, 189, 183, 1):const Color.fromRGBO(43, 45, 48, 1))),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
            trackVisibility: MaterialStateProperty.all<bool>(true),
            thickness: MaterialStateProperty.all<double>(10),
            interactive: true,
          )
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(setColorMode: setColorMode, reset: reset),
    );
  }
}

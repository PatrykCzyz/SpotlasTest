import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/feed/feed_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        colorScheme: const ColorScheme(
          background: Color(0xFFE8E8F0),
          brightness: Brightness.light,
          primary: Color(0xFFFF0040),
          secondary: Colors.white,
          error: Colors.white,
          surface: Color(0xFFE8E8F0),
          onError: Colors.white,
          onBackground: Colors.black,
          onSecondary: Colors.black,
          onPrimary: Colors.black,
          onSurface: Colors.black,
        ),
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.111,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0, 1),
                blurRadius: 8,
              )
            ],
          ),
          subtitle2: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xCCFFFFFF),
            height: 1.333,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0, 1),
                blurRadius: 8,
              )
            ],
          ),
          caption: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.333,
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: const FeedPage(),
    );
  }
}
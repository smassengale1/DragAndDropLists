import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color (0xff00EAFF),
        primary:  const Color (0xff4D4D4B),
        onPrimary: const Color(0xffFFFFFF),

        inversePrimary: const Color(0xffCE42BA),
        secondary: const Color (0xff00EAFF),
        onSecondary: const Color (0xff4D4D4B),

        tertiary: const Color(0xff109CA7),
        error: const Color(0xffF27549),
        brightness: Brightness.dark
    );

    /**
     * uuid are changing on every build so
     * ids are hard scoped
     */


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontFamily: "Helvetica Neue",

          ),
          displayMedium: const TextStyle(
            fontFamily: "Helvetica Neue",
          ),

          displaySmall: const TextStyle(
              fontFamily: "Helvetica Neue"
          ),

          headlineLarge: const TextStyle(
              fontFamily: "Helvetica Neue",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),

          headlineMedium: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: .75,
              fontFamily: "Helvetica Neue"
          ),

          // used for scaffold titles or in app title like
          headlineSmall: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: .75,
              fontFamily: "Helvetica Neue"

          ),

          bodyLarge: const TextStyle(
              fontFamily: "Helvetica Neue"
          )
          ,
          bodyMedium: const TextStyle(
              fontFamily: "Helvetica Neue"
          ),


          // workout builder ex name
          bodySmall: const TextStyle(
              fontSize: 16.0,
              letterSpacing: .5,
              fontFamily: "Helvetica Neue"

          ),

          titleLarge: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Helvetica Neue"

          ),

          // list tiles
          titleMedium: const TextStyle(
              fontSize: 15.0,
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
              fontFamily: "Helvetica Neue"
          ),

          titleSmall: const TextStyle(
              fontSize: 12.0,
              letterSpacing: .5,
              fontWeight: FontWeight.w600,
              fontFamily: "Helvetica Neue"
          ),

          // primarily used for labels in list
          labelLarge: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              color: colorScheme.secondary,
              fontFamily: "Helvetica Neue"
          ),

          // form fields
          labelMedium: const TextStyle(
              fontSize: 18.0,
              letterSpacing: .5,
              fontWeight: FontWeight.w700,
              fontFamily: "Helvetica Neue"
          ),


          labelSmall: const TextStyle(
            fontSize: 12.0,
            letterSpacing: .2,
          ),
        ),

        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600
              ),
            )),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: colorScheme.tertiary,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600
                ))),

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        inputDecorationTheme: const InputDecorationTheme(
            iconColor: Color(0xff109CA7),
            hintStyle: TextStyle(
              fontSize: 14.0,
            )
        ),

        dividerColor: const Color(0xffBCBCBC),
        colorScheme: colorScheme,
      ),
      home: const Test(),
    );

  }


}


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

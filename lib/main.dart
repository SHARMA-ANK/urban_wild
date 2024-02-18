import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urban_wild/Screens/base_screen.dart';
import 'package:urban_wild/Screens/splash_screen.dart';
import 'package:urban_wild/resources/auth_method.dart';

import 'Screens/login_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Wild',
        routes:{
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const BaseScreen(),
          '/splash':(context)=>const SplashScreen()

        },
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(173, 188, 159, 1.0),
        ),
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context,snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return const BaseScreen();
          }return const LoginScreen();
        },
      )

    );
  }
}


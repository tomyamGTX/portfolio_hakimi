import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_hakimi/providers/home.provider.dart';
import 'package:portfolio_hakimi/screen/splash.screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb == true
        ? const FirebaseOptions(
            apiKey: "AIzaSyDawhAuDD5hvGc9u-9Gj4rfKh-_gCHXjIA",
            authDomain: "portfoliohakimi-b90b8.firebaseapp.com",
            projectId: "portfoliohakimi-b90b8",
            storageBucket: "portfoliohakimi-b90b8.appspot.com",
            messagingSenderId: "562408540515",
            appId: "1:562408540515:web:6aabd229eabd49b871ab56",
            measurementId: "G-0FRCCZY4JV")
        : null,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio Hakimi',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

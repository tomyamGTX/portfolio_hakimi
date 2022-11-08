import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: 'My Portfolio',
        theme: ThemeData(
          textTheme: GoogleFonts.adventProTextTheme(),
          useMaterial3: true,
          primarySwatch: Colors.red,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

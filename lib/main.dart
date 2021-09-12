// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zorex_food/scr/providers/auth.dart';
import 'package:zorex_food/scr/screens/home.dart';
import 'package:zorex_food/scr/screens/login.dart';
// import 'package:zorex_food/scr/widgets/loading.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // This is to remove the red banner when debugging.
      title: 'Zorex Food',
      // the name that apperears when I open the application
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenController(),
    ),
  ));
  // This is my main application.
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
      // return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      // break;
      default:
        return LoginScreen();
    }
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of my application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // This is to remove the red banner when debugging.
//       title: 'Zorex Food',
//       // the name that apperears when I open the application
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }

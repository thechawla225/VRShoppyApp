import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrshoppy/Providers/cart_provider.dart';
import 'package:vrshoppy/Screens/welcome_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartNotifier()),
  ], child: const MyApp()));
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
          fontFamily: 'ProximaNova',
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen());
  }
}

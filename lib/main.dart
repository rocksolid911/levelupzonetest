import 'package:flutter/material.dart';
import 'package:levelupzonetest/Screens/splashscreen.dart';
import 'package:levelupzonetest/dataprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      //const MyApp()
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Datap()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}



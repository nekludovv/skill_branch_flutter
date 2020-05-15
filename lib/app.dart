import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/screens/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterGalleryApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      Home(),
//      FullScreenImage(altDescription: 'Языком разработки Flutter-приложений является Dart, а не JavaScript. Dart компилируется в нативный код той платформы, для которой готовится сборка. В этом и есть залог производительного взаимодействия с платформой. Когда дело касается динамических UI-элементов, анимаций, переходов между экранами - всё должно работать предельно эффективно',
//          name: 'Kirill Adechenko', userName: 'kaparray'),
//      Feed(),
    );
  }
}


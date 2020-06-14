import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/screens/home.dart';
//import 'package:FlutterGalleryApp/screens/feed_screen.dart';
//import 'package:FlutterGalleryApp/screens/404.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterGalleryApp',
      home: Home(Connectivity().onConnectivityChanged),
      theme: ThemeData(textTheme: TextTheme (headline1: TextStyle(color: Colors.black26))        ,
      ),
      onUnknownRoute: (RouteSettings settings) {
//        _buildRoute(PageNotFound()),
        return MaterialPageRoute (builder: (BuildContext contex) {
          return Scaffold (
            body: Center (
              child: Column (
                children: <Widget>[
                  Text ('404'),
                  Text ('Page not found'),
                ],
              ),
            ),
          );
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/fullScreenImage') {
          FullScreenImageArguments args = (settings.arguments as FullScreenImageArguments);
            final child = FullScreenImage(
            photo: args.photo,
            altDescription: args.altDescription,
            userName: args.userName,
            name: args.name,
            userPhoto: args.userPhoto,
            heroTag: args.heroTag,
            );
        if (Platform.isAndroid) {
          return CupertinoPageRoute(builder: (context) => child, settings: args.settings);
        } else if (Platform.isIOS) {
          return MaterialPageRoute(builder: (context) => child, settings: args.settings);
          }
        }
      }
    );
  }
}


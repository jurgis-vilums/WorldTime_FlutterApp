import 'package:flutter/material.dart';
import 'package:wordl_time/pages/home.dart';
import 'package:wordl_time/pages/loading.dart';
import 'package:wordl_time/pages/choose _location.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  debugShowCheckedModeBanner: false,

));
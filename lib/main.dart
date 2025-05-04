import 'package:flutter/material.dart';

import './view/addEvent_screen.dart';
import './view/event_screen.dart';
import './view/home_screen.dart'; // home_screen.dart 경로에 맞게 import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inviit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // 필요 시 light()로 바꾸세요
      home: HomeScreen(), // 여기서 시작 화면 지정!
      routes: {
        '/event': (context) => const EventScreen(),
        '/add_event': (context) => const AddEventScreen(),
      },
    );
  }
}

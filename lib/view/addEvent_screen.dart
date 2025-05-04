// lib/addEvent_screen.dart
import 'package:flutter/material.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '이벤트 생성',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          '새로운 이벤트 작성 화면',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

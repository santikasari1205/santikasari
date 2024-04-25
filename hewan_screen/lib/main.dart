import 'package:flutter/material.dart';
import 'package:santikasari/hewan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: hewanScreen(),
    );
  }
}

class Beranda extends StatelessWidget {
  const Beranda({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Beranda'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

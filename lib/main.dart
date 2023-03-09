import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick_tack_toe_gaming/ui/providers/counter_provider.dart';
import 'package:tick_tack_toe_gaming/ui/view/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<CounterProvider>(create: (_) => CounterProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}

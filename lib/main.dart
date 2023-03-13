import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick_tack_toe_gaming/ui/providers/tapped_provider.dart';
import 'package:tick_tack_toe_gaming/ui/view/home_page.dart';
import 'package:tick_tack_toe_gaming/ui/view/loading_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<TappedProvider>(create: (_) => TappedProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.blueGrey,
      // ),
      theme: ThemeData.dark(),
      home: const LoadingPage(),
    );
  }
}

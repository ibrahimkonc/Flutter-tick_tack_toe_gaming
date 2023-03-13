import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tick_tack_toe_gaming/ui/view/home_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hoşgeldiniz", style: TextStyle(fontSize: 45)),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            child: LottieBuilder.asset("assets/lottie/loading.json"),
            height: 180,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text("Tick Tack Toe", style: TextStyle(fontSize: 35)),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(side: BorderSide(width: 2)),
                padding: const EdgeInsets.all(20),
                backgroundColor: const Color.fromARGB(163, 7, 255, 40)),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()));
            }, //() => counterProvider.incrementCounter(),
            label: const Text(
              "BAŞLA",
              style: TextStyle(fontSize: 35),
            ),
            icon: const Icon(
              Icons.play_circle,
              size: 50,
            ),
          ),
        ],
      )),
    );
  }
}

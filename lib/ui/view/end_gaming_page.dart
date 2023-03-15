import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tick_tack_toe_gaming/ui/view/home_page.dart';
import '../providers/tapped_provider.dart';

class EndGamingPage extends StatelessWidget {
  String data = "";
  // EndGamingPage(this.data);
  EndGamingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var tappedProvider = Provider.of<TappedProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SONUÇ"),
        leading: Container(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.grey,
            Colors.black,
          ], radius: 0.85, focal: Alignment.center),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LottieBuilder.asset("assets/lottie/stars-winner.json"),
              height: 180,
            ),
            Text(
              data.isEmpty
                  ? "Skor Tablosu"
                  : data.replaceAll("Oyun Bitti...", ""),
              style: const TextStyle(fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(157, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.black)),
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 20,
                left: 50,
                right: 50,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("X Kullanıcısı Puanı: ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 3, 165, 0))),
                        Text(tappedProvider.xScore.toString(),
                            style: const TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 3, 165, 0)))
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 5,
                    color: Color.fromARGB(64, 51, 51, 51),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("O Kullanıcısı Puanı: ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 187, 63, 63))),
                        Text(tappedProvider.oScore.toString(),
                            style: const TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 187, 63, 63)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!(tappedProvider.xScore == 5 || tappedProvider.oScore == 5))
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color.fromARGB(151, 7, 18, 167)),
                onPressed: () {
                  if (tappedProvider.xScore == 5 ||
                      tappedProvider.oScore == 5) {
                    null;
                  } else {
                    tappedProvider.clean(false);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                }, //() => counterProvider.incrementCounter(),
                label: const Text(
                  "Oynamaya Devam",
                  style: TextStyle(fontSize: 18),
                ),
                icon: const Icon(Icons.refresh),
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: const Color.fromARGB(164, 255, 193, 7)),
              onPressed: () {
                tappedProvider.clean(true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }, //() => counterProvider.incrementCounter(),
              label: const Text(
                "Tekrar Oyna",
                style: TextStyle(fontSize: 18),
              ),
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

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
            Text(
              data.replaceAll("Oyun Bitti...", ""),
              style: const TextStyle(fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black)),
              margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("X Kullanıcısı Puanı: ",
                          style: TextStyle(fontSize: 25)),
                      Text(tappedProvider.xScore.toString(),
                          style: const TextStyle(fontSize: 25))
                    ],
                  ),
                  const Divider(
                    thickness: 5,
                    color: Color.fromARGB(255, 255, 156, 149),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("O Kullanıcısı Puanı: ",
                            style: TextStyle(fontSize: 25)),
                        Text(tappedProvider.oScore.toString(),
                            style: const TextStyle(fontSize: 25))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.green),
              onPressed: () {
                tappedProvider.clean(false);
                Navigator.pop(context);
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
                  backgroundColor: const Color.fromARGB(255, 175, 76, 76)),
              onPressed: () {
                tappedProvider.clean(true);
                Navigator.pop(context);
              }, //() => counterProvider.incrementCounter(),
              label: const Text(
                "Tekrar Oyna",
                style: TextStyle(fontSize: 18),
              ),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}

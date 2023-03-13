import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/tapped_provider.dart';
import 'end_gaming_page.dart';
  
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var tappedProvider = Provider.of<TappedProvider>(context);
    Size boyut = MediaQuery.of(context).size;
    tappedProvider.defaulWidth = boyut.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tick Tack Toe"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 20,
                color: const Color.fromARGB(255, 187, 63, 63),
                width: boyut.width,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.black, width: 0.1),
                //   gradient:
                //       const LinearGradient(colors: [Colors.red, Colors.green]),
                //borderRadius: BorderRadius.circular(10),
                // ),
              ),
              Consumer<TappedProvider>(
                builder: (context, value, child) {
                  return AnimatedContainer(
                    width: (tappedProvider.changeWidth == 0
                            ? tappedProvider.defaulWidth
                            : tappedProvider.changeWidth) /
                        2,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 3, 165, 0)),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                },
              )
            ],
          ),
          Expanded(
            // creating the ScoreBoard
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 3, 165, 0),
                            )),
                        child: Text(
                          'Player X',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: !tappedProvider.oTurn
                                  ? const Color.fromARGB(255, 255, 242, 124)
                                  : Colors.white),
                        ),
                      ),
                      Text(
                        tappedProvider.xScore.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 187, 63, 63),
                            )),
                        child: Text('Player O',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: tappedProvider.oTurn
                                    ? const Color.fromARGB(255, 255, 242, 124)
                                    : Colors.white)),
                      ),
                      Text(
                        tappedProvider.oScore.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (tappedProvider.filledBoxes <= 8 &&
                          tappedProvider.end.isEmpty) {
                        tappedProvider.index = index;
                        tappedProvider.tapped();
                        if (tappedProvider.end.isNotEmpty) {
                          _showDrawDialog(context, tappedProvider.end);
                        }
                      } else {
                        if (tappedProvider.end.isNotEmpty) {
                          _showDrawDialog(context, tappedProvider.end);
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          tappedProvider.displayElement[index].toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "İŞLEM: ${tappedProvider.end.isEmpty ? "${!tappedProvider.oTurn ? "[ X ]" : "[ O ]"} Kullanıcısı Oynuyor..." : tappedProvider.end}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),
                if (!(tappedProvider.xScore == 5 || tappedProvider.oScore == 5))
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Color.fromARGB(151, 7, 18, 167)),
                    onPressed: () {
                      tappedProvider.clean(false);
                    }, //() => counterProvider.incrementCounter(),
                    label: const Text(
                      "Paneli temizle",
                      style: TextStyle(fontSize: 18),
                    ),
                    icon: const Icon(Icons.refresh),
                  ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Color.fromARGB(164, 255, 193, 7)),
                  onPressed: () {
                    tappedProvider.clean(true);
                  }, //() => counterProvider.incrementCounter(),
                  label: const Text(
                    "Oyunu Sıfırla",
                    style: TextStyle(fontSize: 18),
                  ),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showDrawDialog(BuildContext context, String data) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                SizedBox(
                  child: LottieBuilder.asset("assets/lottie/winner.json"),
                  height: 200,
                ),
                Text(data),
              ],
            ),
            actions: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow, size: 50),
                    color: Colors.pinkAccent,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EndGamingPage(data: data)));
                    },
                    splashColor: Colors.greenAccent,
                    iconSize: 50,
                  ),
                ),
              )
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var tappedProvider = Provider.of<TappedProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tick Tack Toe"),
      ),
      body: Column(
        children: [
          Expanded(
            // creating the ScoreBoard
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player X',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: !tappedProvider.oTurn
                                  ? Colors.greenAccent
                                  : Colors.white),
                        ),
                        Text(
                          tappedProvider.xScore.toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player O',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: tappedProvider.oTurn
                                    ? Colors.greenAccent
                                    : Colors.white)),
                        Text(
                          tappedProvider.oScore.toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                      tappedProvider.index = index;
                      tappedProvider.tapped();
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
            child: Text(
              "${!tappedProvider.oTurn ? "X" : "O"} Kullanıcısı Oynuyor...",
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

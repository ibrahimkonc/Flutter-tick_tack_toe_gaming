import 'package:flutter/widgets.dart';
import '../../data/repo/repository.dart';

class TappedProvider with ChangeNotifier {
  int index = 0;
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  String end = "";

  int get getIndex => index;
  int get getoScore => oScore;
  int get getxScore => xScore;
  String get getSnd => end;
  List<String> get getdisplayElement => displayElement;

  var counterRepo = CheckWinnerRepository();

  bool oTurn = false;
  int filledBoxes = 0;

  void tapped() {
    if (oTurn && displayElement[index] == '') {
      displayElement[index] = 'O';
      filledBoxes++;
    } else if (!oTurn && displayElement[index] == '') {
      displayElement[index] = 'X';
      filledBoxes++;
    }

    oTurn = !oTurn;
    String response = counterRepo.checkWinner(displayElement, filledBoxes);
    if (response == "X") {
      xScore++;
    } else if (response == "O") {
      oScore++;
    } else {
      end = "Oyun Bitti";
    }

    notifyListeners();
    //_checkWinner();
  }
}

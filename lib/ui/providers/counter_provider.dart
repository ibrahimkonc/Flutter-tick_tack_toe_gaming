import 'package:flutter/widgets.dart';
import '../../data/repo/repository.dart';

class TappedProvider with ChangeNotifier {
  int index = 0;
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  String end = "";
  bool oTurn = false;
  int filledBoxes = 0;

  int get getIndex => index;
  int get getoScore => oScore;
  int get getxScore => xScore;
  String get getSnd => end;
  bool get getoTurn => oTurn;
  int get getfilledBoxes => filledBoxes;
  List<String> get getdisplayElement => displayElement;

  var counterRepo = CheckWinnerRepository();

  void tapped() {
    if (filledBoxes <= 8 && displayElement[index] == '' && end.isEmpty) {
      if (oTurn) {
        displayElement[index] = 'O';
        filledBoxes++;
      } else if (!oTurn) {
        displayElement[index] = 'X';
        filledBoxes++;
      }

      oTurn = !oTurn;
      String response = counterRepo.checkWinner(displayElement, filledBoxes);
      if (response == "X") {
        xScore++;
        end = "[ X ] KAZANDI Oyun Bitti...";
      } else if (response == "O") {
        oScore++;
        end = "[ O ] KAZANDI Oyun Bitti...";
      } else {
        end = "";
      }
    }
    notifyListeners();
  }

  void clean(bool isClean) {
    index = 0;
    isClean ? oScore = 0 : null;
    isClean ? xScore = 0 : null;
    end = "";
    displayElement = ['', '', '', '', '', '', '', '', ''];
    oTurn = false;
    filledBoxes = 0;
    notifyListeners();
  }
}

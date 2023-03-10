import 'package:flutter/widgets.dart';
import '../../data/repo/repository.dart';

class TappedProvider with ChangeNotifier {
  int index = 0;
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int get getIndex => index;
  List<String> get getdisplayElement => displayElement;

  var counterRepo = CounterRepository();

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
    print(index);
    print(oTurn);
    print(displayElement);
    oTurn = !oTurn;

    notifyListeners();
    //_checkWinner();
  }
}

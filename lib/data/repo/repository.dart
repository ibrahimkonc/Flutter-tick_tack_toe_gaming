class CheckWinnerRepository {
  String checkWinner(List<String> displayElement, int filledBoxes) {
    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      return displayElement[0];
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      return displayElement[3];
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      return displayElement[6];
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      return displayElement[0];
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      return displayElement[1];
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      return displayElement[6];
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      return displayElement[0];
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      return displayElement[2];
    } else if (filledBoxes == 9) {
      return "";
    } else {
      return "";
    }
  }
}

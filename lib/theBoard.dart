class Theboard {
  List<List<String>> board = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
  ];

  //Print panel function
  void printBoard() {
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('---|---|---');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('---|---|---');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
  }

  //Receive number function
  bool placeSymbol(int number, String symbol) {
    if (number < 1 || number > 9) {
      print("Invalid entry. Enter a number from 1 to 9.");
      return false;
    }
    int row = (number - 1) ~/ 3;
    int col = (number - 1) % 3;

    if (board[row][col] == 'X' || board[row][col] == 'O') {
      print("Cell already taken. Try again");
      return false;
    }
    board[row][col] = symbol;
    return true;
  }

  //Player win verification function
  bool checkWinner(String symbol) {
    //rows and columns
    for (int i = 0; i < 3; i++) {
      if ((board[i][0] == symbol &&
              board[i][1] == symbol &&
              board[i][2] == symbol) ||
          (board[0][i] == symbol &&
              board[1][i] == symbol &&
              board[2][i] == symbol)) {
        return true;
      }
    }
    //diagonals
    if ((board[0][0] == symbol &&
            board[1][1] == symbol &&
            board[2][2] == symbol) ||
        (board[0][2] == symbol &&
            board[1][1] == symbol &&
            board[2][0] == symbol)) {
      return true;
    }
    return false;
  }

  //Equivalence check function
  bool checkDraw() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] != 'X' && board[i][j] != 'O') {
          return false;
        }
      }
    }
    return true;
  }

  //Game reset function
  void resetBoard() {
    board = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];
  }
}

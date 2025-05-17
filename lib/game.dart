import 'dart:io';
import 'package:tic_tac_toe_game/player.dart';
import 'package:tic_tac_toe_game/theBoard.dart';

class Game {
  final Theboard board = Theboard();
  final Player player1 = Player("X");
  final Player player2 = Player("O");
  

  //Game start function
  void start() {
    Player currentPlayer = player1;
    bool gameEnded = false;

    print("Welcome to Tic Tac Toe!");
    print("Player 1 is X and Player 2 is O");

    //loop until the game ends
    while (!gameEnded) {
      //Print the board
      board.printBoard();
      print("Player ${currentPlayer.symbol}, enter your move (1-9): ");
      String? input = stdin.readLineSync();
      int? num = int.tryParse(input ?? "");

      if (num == null || !board.placeSymbol(num, currentPlayer.symbol)) {
        continue;
      }

      if (board.checkWinner(currentPlayer.symbol)) {
        board.printBoard();
        print("Player ${currentPlayer.symbol} has won!");
        gameEnded = true;
      } else if (board.checkDraw()) {
        board.printBoard();
        print("It's a draw!");
        gameEnded = true;
      } else {
        currentPlayer = (currentPlayer == player1) ? player2 : player1;
      }
    }

    //Ask if the player wants to play again
    print("Do you want to play again? (y/n): ");
    String? ag = stdin.readLineSync();
    if (ag?.toLowerCase() == "y") {
      board.resetBoard();
      start();
    } else {
      print("Goodbye !");
      exit(0);
    }
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_tao/game_button.dart';

import 'custom_dialog.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<GameButton> listButtons ;
  int activePlayer = 1;
  var listPlayer1;
  var listPlayer2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listButtons = initialize();
  }

  List<GameButton> initialize () {
    activePlayer = 1;
    listPlayer1 = [];
    listPlayer2 = [];

    var Buttons = <GameButton>[
      new GameButton(1),
      new GameButton(2),
      new GameButton(3),
      new GameButton(4),
      new GameButton(5),
      new GameButton(6),
      new GameButton(7),
      new GameButton(8),
      new GameButton(9),
    ];
    return Buttons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.backgroundColor = Colors.amber;
        activePlayer = 2;
        listPlayer1.add(gb.id);
      } else {
        gb.text = "O";
        gb.backgroundColor = Colors.black87;
        activePlayer = 1;
        listPlayer2.add(gb.id);
      }

      gb.enabled = false;
      checkWinner();
    });
  }

  int checkWinner() {
    var winner = -1;
    if (listPlayer1.contains(1) && listPlayer1.contains(2) && listPlayer1.contains(3)) {
      winner = 1;
    }
    if (listPlayer2.contains(1) && listPlayer2.contains(2) && listPlayer2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (listPlayer1.contains(4) && listPlayer1.contains(5) && listPlayer1.contains(6)) {
      winner = 1;
    }
    if (listPlayer2.contains(4) && listPlayer2.contains(5) && listPlayer2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (listPlayer1.contains(7) && listPlayer1.contains(8) && listPlayer1.contains(9)) {
      winner = 1;
    }
    if (listPlayer2.contains(7) && listPlayer2.contains(8) && listPlayer2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (listPlayer1.contains(1) && listPlayer1.contains(4) && listPlayer1.contains(7)) {
      winner = 1;
    }
    if (listPlayer2.contains(1) && listPlayer2.contains(4) && listPlayer2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (listPlayer1.contains(2) && listPlayer1.contains(5) && listPlayer1.contains(8)) {
      winner = 1;
    }
    if (listPlayer2.contains(2) && listPlayer2.contains(5) && listPlayer2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (listPlayer1.contains(3) && listPlayer1.contains(6) && listPlayer1.contains(9)) {
      winner = 1;
    }
    if (listPlayer2.contains(3) && listPlayer2.contains(6) && listPlayer2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (listPlayer1.contains(1) && listPlayer1.contains(5) && listPlayer1.contains(9)) {
      winner = 1;
    }
    if (listPlayer2.contains(1) && listPlayer2.contains(5) && listPlayer2.contains(9)) {
      winner = 2;
    }

    if (listPlayer1.contains(3) && listPlayer1.contains(5) && listPlayer1.contains(7)) {
      winner = 1;
    }
    if (listPlayer2.contains(3) && listPlayer2.contains(5) && listPlayer2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => new CustomDialog("Player 1 Won",
                "Press the reset button to start again.", resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => new CustomDialog("Player 2 Won",
                "Press the reset button to start again.", resetGame));
      }
    }

    return winner;
  }

  void resetGame () {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      listButtons = initialize();
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Tao"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: 8,left: 3,right: 3),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
        ),
        itemCount: listButtons.length,
        itemBuilder: (BuildContext context, int index) {
           return SizedBox(
             width: 100,
             height: 100,
             child: RaisedButton(
               child: Text(
                   listButtons[index].text,
                 style: TextStyle(fontSize: 25, color: Colors.white),
               ),
               onPressed: listButtons[index].enabled?()=> playGame(listButtons[index]):null,
               color: listButtons[index].backgroundColor,
               disabledColor: listButtons[index].backgroundColor,
             ),
           );
        },
      ),

    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

//Statefull widget used when user interaction happens.
//Stateless widget used when there is no interaction with user

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 4;
  int rightDiceNumber = 5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //flex: 2,   //ratio with other widgets
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                child: Image.asset('images/dice$leftDiceNumber.png'),
                onPressed: () {
                  //on click
                  rollBothDice();
                },
              ),
            ),
          ),
          Expanded(
            //flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onPressed: () {
                  print('right button pressed');

                  rollBothDice();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void rollBothDice() {
    setState(() {
      leftDiceNumber =
          Random().nextInt(6) + 1; //random generates 0 to 5 .so adding 1
      rightDiceNumber =
          Random().nextInt(6) + 1; //random generates 0 to 5 .so adding 1
    });
  }
}

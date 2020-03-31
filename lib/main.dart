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
                  setState(() {
                    //changing both dice when any one clicked
                    //without this, ui wont update
                    //call again build method and update ui changes
                    leftDiceNumber = Random().nextInt(6) +
                        1; //random generates 0 to 5 .so adding 1
                    rightDiceNumber = Random().nextInt(6) +
                        1; //random generates 0 to 5 .so adding 1

                    print('Left Random number generatd = $leftDiceNumber');
                  });
                  print('left button pressed');
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

                  setState(() {
                    //changing both dice when any one clicked

                    leftDiceNumber = Random().nextInt(6) +
                        1; //random generates 0 to 5 .so adding 1
                    rightDiceNumber = Random().nextInt(6) +
                        1; //random generates 0 to 5 .so adding 1
                    print('Right Random number generatd = $rightDiceNumber');
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

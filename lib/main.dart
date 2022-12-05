import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void tossDie() {
    rightDiceNumber = Random().nextInt(6) + 1;
    leftDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   'Tap die to roll',
          //   style: TextStyle(color: Colors.white, fontSize: 28.0),
          // ),
          // SizedBox(height: 80.0),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    setState(() {
                      rightDiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.all(8.0),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              side: BorderSide(
                width: 2,
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                tossDie();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Roll Both',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

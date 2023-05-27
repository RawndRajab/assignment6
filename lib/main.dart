import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Rock Scissors Paper Game'),
      ),
      body: RPS(),
    ),
  ));
}

class RPS extends StatefulWidget {
  const RPS({Key? key}) : super(key: key);

  @override
  State<RPS> createState() => _RPSState();
}

class _RPSState extends State<RPS> {
  int leftimg = 1;
  int rightimg = 1;
  int youScore = 0;
  int systemScore = 0;
  // int winScore = 1;

  // @override
  // void initState() {
  // TODO: implement initState
  //   leftimg = Random().nextInt(3) + 1;
  //   rightimg = Random().nextInt(3) + 1;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'YOU',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            Text(
              'SYSTEM',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
        // Center(
        //   child: Text(
        //     'Score ',
        //     style: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text(
            //   youScore == 3 ? "you win" : "System win ",
            //   style: TextStyle(
            //     fontSize: 36,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Text(
              ' $youScore // 3',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' $systemScore // 3',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(
                    () {
                      leftimg = Random().nextInt(3) + 1;
                      rightimg = Random().nextInt(3) + 1;
                      if (systemScore == 3 || youScore == 3) {
                        systemScore = 0;
                        youScore = 0;
                      }
                      if ((leftimg == 1 && rightimg == 2) ||
                          (leftimg == 3 && rightimg == 1) ||
                          (leftimg == 2 && rightimg == 3)) {
                        youScore++;
                      } else if ((rightimg == 1 && leftimg == 2) ||
                          (rightimg == 3 && leftimg == 1) ||
                          (rightimg == 2 && leftimg == 3)) {
                        systemScore++;
                      }

                      // while (youScore != 5 || systemScore != 4);

                      // print('your Score : $youScore,System score $systemScore');
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    'images/img$leftimg.jpg',
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    // play;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    'images/img$rightimg.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),

        Text(
          youScore == 3 ? 'YOU WIN ' : "",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        Text(
          systemScore == 3 ? 'SYSTEM WIN ' : "",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
        )
        // TextButton(
        //   onPressed: () {
        //     setState(() {});
        //   },
        //   child: Text(
        //     'START',
        //     style: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // )
      ],
    );
  }
}

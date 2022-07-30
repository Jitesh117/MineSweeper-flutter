import 'package:flutter/material.dart';
import 'package:minesweeper/bomb.dart';
import 'package:minesweeper/numberBox.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int numberOfSquares = 9 * 9;
  int numberInEachRow = 9;
  var squareStatus = []; // [numbre of bombs around, revealed = true/false]

  final List<int> bombLocation = [
    4,
    40,
    61,
  ];
  @override
  void initState() {
    super.initState();

    // initially all squares have 0 bombs around and is not revealed
    for (int i = 0; i < numberOfSquares; i++) {
      squareStatus.add([0, false]);
    }
  }

  void revealBoxNumbers(int index) {
    setState(() {
      squareStatus[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          // game stats and menu
          Container(
            height: 150,
            // color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '6',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text('BOMB'),
                  ],
                ),
                Card(
                  color: Colors.grey[700],
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '0',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text('TIME'),
                  ],
                ),
              ],
            ),
          ),

          // Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: numberInEachRow,
              ),
              itemCount: numberOfSquares,
              itemBuilder: (BuildContext context, int index) {
                if (bombLocation.contains(index)) {
                  return MyBomb(
                    child: index,
                    revealed: squareStatus[index][1],
                    function: () {
                      //player tapped the bomb, they lose
                    },
                  );
                } else {
                  return MyNumberBox(
                    child: index,
                    revealed: squareStatus[index][1],
                    function: () {
                      // reveal current box
                      revealBoxNumbers(index);
                    },
                  );
                }
              },
            ),
          ),

          // Branding
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Text('M I N E S W E E P E R'),
          )
        ],
      ),
    );
  }
}

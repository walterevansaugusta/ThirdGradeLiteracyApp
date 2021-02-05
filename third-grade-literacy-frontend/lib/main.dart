import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Structures',
      theme: ThemeData(),
      home: Material(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            sideBar,
            Expanded(
              child: mainSections,
            )
          ],
        )
      )
    );
  }
}

Widget sideBar = Container(
  color: const Color(0xffc4e8e6),
  child: Column(
    children: <Widget>[
      Material(
        child: IconButton(
          icon: Image.asset('assets/placeholder_back_button.png'),
          onPressed: () {  },
        )
      ),
      Material(
        child: IconButton(
          icon: Image.asset('assets/placeholder_home_button.png'),
          onPressed: () {  },
        )
      ),
      Spacer(flex: 5),
      Material(
        child: IconButton(
          icon: Image.asset('assets/placeholder_piggy_button.png'),
          onPressed: () {  }
        )
      ),
    ]
  )
);

Widget mainSections = Container(
  color: const Color(0xff6ec6d4),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'Word Structures',
        style: TextStyle(
          fontFamily: 'Comic',
          fontSize: 30,
        )
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: const Color(0xff96e4a2),
            child: Text('\n 1 \n Base Words and Endings \n ed ing \n',
              style: TextStyle(
                fontFamily: 'Comic',
                fontSize: 15
              ),
              textAlign: TextAlign.center,
            )
          ),
          Container(
              color: const Color(0xff66cf69),
              child: Text('\n 2 \n Base Words and Endings \n s es \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(
              color: const Color(0xfffdf885),
              child: Text('\n 3 \n Comparative \n Endings \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              color: const Color(0xffbc8f75),
              child: Text('\n 4 \n Plurals \n  \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(
              color: const Color(0xfff3b2c8),
              child: Text('\n 5 \n Possessives \n  \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(
              color: const Color(0xfff3b98c),
              child: Text('\n 6 \n Contractions \n  \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(
              color: const Color(0xffb87cbe),
              child: Text('\n 7 \n Compound \n Words \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              color: const Color(0xff6abad7),
              child: Text('\n 8 \n Prefixes \n  \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(
              color: const Color(0xfffcf351),
              child: Text('\n 9 \n Suffixes \n  \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(
              color: const Color(0xffee8640),
              child: Text('\n 10 \n Syllables \n  \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
        ],
      )
    ],
  )
);

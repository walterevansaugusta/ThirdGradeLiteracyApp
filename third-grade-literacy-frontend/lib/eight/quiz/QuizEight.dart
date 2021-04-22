import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/StreakMain.dart';
import 'package:hearatale_literacy_app/eight/ScoreMenuEight.dart';

import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';

class QuizEight extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizEight> {
  var answers = [
    // correct answers from 8.1 - 8.9
    ["unable", "unequal", "unplug", "uneven", "unafraid", "uncertain", // 8.1
      "disagree", "dislike", "distrust", "disappear", "disobey", "dishonest", // 8.2
      "incomplete", "incorrect", "invisible", "inhuman", "inactive", "incapable" // 8.3
      "impolite", "impossible", "impure", "imbalance", "immature", "impatient", // 8.4
      "redone", "repaint", "relight", "remove", "reread", "replace", // 8.5
      "mismatch", "misuse", "miskick", "misplace", "mistrust", "misspell", // 8.6
      "prefix" , "preschool", "preteen", "preheat", "presliced", "prewash",// 8.7
      "overflow", "overdo", "overaged", "overgrow", "overcook", "overfill", //8.8
      "underage", "underripe", "undersize", "undershoot", "undercount", "undergown" //8.9
    ],
    // incorrect answers
    ["acrobat", "adult", "aerialist", "agile", "alien", "align", "android", "around",
      "babies", "bald", "burger",
      "cake", "call", "camp", "camping", "cat", "champ", "champion", "chocolate", "cocoon",
        "collision", "cologne", "confusion", "consult", "cost", "crawl", "crumbs", "cute",
      "diamond", "diesel", "difficult", "division", "dusk",
      "explode", "explore"
    ],
    ["farm", "field", "fold", "foreign", "freight", "fridge", "frost", "frosting",
      "gift", "gnarly", "gnat", "gnome", "gossip", "ground", "gymnast",
      "halt", "haunt", "hound",
      "icicle", "icicles", "illusion",
      "kite", "kitty", "kneel", "knob",
      "machete", "machine", "muscles", "muzzle",
      "napped",
      "pepper", "phantom", "photo", "picnic", "picture", "pixie", "postage",
      "zero", "zoo"
    ],
    ["referee", "rhino", "rhyme", "rhythm", "riddles",
      "scare", "scold", "scribble", "scrub", "shave", "shelf", "shell", "silence",
        "silent", "skater", "skeleton", "slither", "smart", "smear", "smooth",
        "splinter", "spread", "spring", "stick", "structures", "swift", "sword",
      "tennis", "theft",
      "umpire", "uniforms",
      "vanilla", "vision",
      "whisper", "wiggle", "wink", "wreck", "wrinkled", "wrinkles",
    ]
  ];
  String questionAudio = "dropbox/SectionEight/EightPointZero/#8.0_Q_WhichWordHasAPrefix.mp3";
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int index = 7; // for calling StreakMain methods
  int attempt = 0; // how many tries before answering correctly

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    answerOrder.shuffle();
    attempt = 0;

    if (prevCorrect < 0) {
      audioCache.load(questionAudio);
      playAudio(questionAudio);
    }

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                sideBar(context),
                Expanded(
                    child: sub(context)
                )
              ],
            )
        )
    );
  }

  Widget sideBar(BuildContext context) {
    return Container(
        color: const Color(0xffc4e8e6),
        child: Column(
            children: <Widget>[
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_back_button.png'),
                    onPressed: () {
                      stopAudio();
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {
                      stopAudio();
                      Navigator.pushAndRemoveUntil(context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => MyApp(),
                              transitionDuration: Duration(seconds: 0)
                          ), (route) => false);
                    },
                  )
              ),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playAudio(questionAudio);
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/star_button.png'),
                    onPressed: () {
                      stopAudio();
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => ScoreEight(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    },
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_piggy_button.png'),
                      onPressed: () {
                        stopAudio();
                      }
                  )
              ),
            ]
        )
    );
  }

  Widget sub(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Which word has a prefix?',
                style: textStyle(Colors.black, screenWidth / 24)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 0
                GestureDetector(
                    onTap: () {
                      // if the choice is correct
                      if (answerOrder[0] == 0) {
                        // if this is the first try
                        if (attempt == 0) {
                          // increase correct answer streak
                          StreakMain.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      // choice is not correct
                      else {
                        // increment attempt counter
                        attempt += 1;
                        // reset correct answer streak
                        StreakMain.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(0), screenWidth / 24)
                    )
                ),
                // Box 1
                GestureDetector(
                    onTap: () {
                      if (answerOrder[1] == 0) {
                        if (attempt == 0) {
                          StreakMain.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakMain.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(1), screenWidth / 24)
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 2
                GestureDetector(
                    onTap: () {
                      if (answerOrder[2] == 0) {
                        if (attempt == 0) {
                          StreakMain.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakMain.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(2), screenWidth / 24)
                    )
                ),
                // Box 3
                GestureDetector(
                    onTap: () {
                      if (answerOrder[3] == 0) {
                        if (attempt == 0) {
                          StreakMain.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakMain.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding(getChoice(3), screenWidth / 24)
                    )
                ),
              ],
            )
          ],
        )
    );
  }

  String getChoice(int boxNum) {
    int index = answerOrder[boxNum];
    int temp = random.nextInt(answers[index].length);
    if (index == 0) {
      while (prevCorrect == temp) {
        temp = random.nextInt(answers[0].length);
      }
      prevCorrect = temp;
    }
    return answers[index][temp];
  }

  playAudio(String path) async {
    stopAudio();
    audioPlayer = await audioCache.play(path);
  }
  stopAudio() {
    audioPlayer.stop();
  }
}

double screenHeight, screenWidth;
var random = new Random();

Padding padding(String text, double size) {
  return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        text,
        style: textStyle(Colors.black, size),
        textAlign: TextAlign.center,
      )
  );
}
BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: const Color(0xff00eeff),
    border: Border.all(color: const Color(0xff008cb3), width: 3),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}
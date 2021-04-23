import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/three/quiz/QuizThreePointTwo.dart';
import 'package:hearatale_literacy_app/three/ScoreMenuThree.dart';
import '../helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: ThreePointTwoLesson()
  ));
}
class ThreePointTwoLesson extends StatefulWidget {
  @override
  ThreePointTwo createState() => ThreePointTwo();
}
class ThreePointTwo extends State<ThreePointTwoLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionThree/ThreePointTwo/1_4_blue-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointTwo/2_4_large-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointTwo/3_4_little-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointTwo/4_4_nice-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointTwo/5_4_rude-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointTwo/6_4_strange-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointTwo/7_4_tame-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointTwo/8_4_wide-er-est.png')];
  var words = [['blue', 'bluer', 'bluest'], ['large', 'larger', 'largest'],
    ['little', 'littler', 'littlest'], ['nice', 'nicer', 'nicest'],
    ['rude', 'ruder', 'rudest'], ['strange', 'stranger', 'strangest'],
    ['tame', 'tamer', 'tamest'], ['wide', 'wider', 'widest']];
  var music = ["blue.mp3",
    "large.mp3",
    "little.mp3",
    "nice.mp3",
    "rude.mp3",
    "strange.mp3",
    "tame.mp3",
    "wide.mp3"];
  int tracker = 0;
  bool marker = true;

  String questionAudio = '#3.2_wordsdropEandaddERorEST.mp3';
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    if (marker) {
      playAudio();
    }
    marker = false;
    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                sideBarWithReplay(context),
                Expanded(
                    child: sub(context)
                )
              ],
            )
        )
    );
  }

  Widget sideBarWithReplay(BuildContext context) {
    return Container(
        color: const Color(0xffc4e8e6),
        child: Column(
            children: <Widget>[
              backButton(context),
              homeButton(context),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {
                        stopAudio();
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => QuizThreePointTwo(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playAudio();
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
                               pageBuilder: (context, _, __) => ScoreThree(),
                               transitionDuration: Duration(seconds: 0)
                           )
                       );
                    },
                  )
              ),
              pinkPigButton(context)
            ]
        )
    );
  }

  Widget sub(BuildContext context) {
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // can probably simplify with RichText
                  Text('When comparing things, words that end in e',
                      style: textStyle(Colors.black, screenWidth / 23)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('drop the e and add ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                  Text('er ',
                      style: textStyle(Colors.red, screenWidth / 23)
                  ),
                  Text('or ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                  Text('est',
                      style: textStyle(Colors.red, screenWidth / 23)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, screenWidth / 23)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.6,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == 0)? pictures.length - 1 : tracker - 1;});
                          playAudio2();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: pictures[tracker],
                      width: 200
                  ),
                  Container(
                    height: screenHeight * 0.6,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == pictures.length - 1)? 0 : tracker + 1;});
                          playAudio2();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child:
                      Text(words[tracker][0], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][1], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][2], style: textStyle(Colors.black, 30))
                  )
                ],
              )
            ]
        )
    );
  }
  playAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(questionAudio);
  }
  playAudio2() async {
    stopAudio();
    audioPlayer = await audioCache.play(music[tracker]);
  }
}

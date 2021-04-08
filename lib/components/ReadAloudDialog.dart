import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mighty_news/components/AppWidgets.dart';
import 'package:mighty_news/main.dart';
import 'package:mighty_news/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

enum TtsState { playing, stopped, paused, continued }

class ReadAloudDialog extends StatefulWidget {
  static String tag = '/ReadAloudDialog';
  final String text;

  ReadAloudDialog(this.text);

  @override
  ReadAloudDialogState createState() => ReadAloudDialogState();
}

class ReadAloudDialogState extends State<ReadAloudDialog> with TickerProviderStateMixin {
  FlutterTts flutterTts = FlutterTts();

  TtsState ttsState = TtsState.stopped;

  AnimationController animationController;
  int currentWordPosition = 0;
  int progress = 0;

  bool isError = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    init();
  }

  Future<void> init() async {
    bool isLanguageFound = false;

    flutterTts.getLanguages.then((value) {
      Iterable it = value;

      it.forEach((element) {
        if (element.toString().contains(appStore.languageForTTS)) {
          flutterTts.setLanguage(element);
          initTTS();
          isLanguageFound = true;
        }
      });
    });

    if (!isLanguageFound) initTTS();
  }

  Future<void> initTTS() async {
    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      stop();
    });

    flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
      currentWordPosition++;

      if (progress < 100) {
        progress = (currentWordPosition * 110) ~/ text.split(' ').length;
        setState(() {});
      }
    });

    flutterTts.setErrorHandler((msg) async {
      await Future.delayed(Duration(milliseconds: 500));

      if (!isError && mounted && context != null) {
        isError = true;
        finish(context);
        toast(errorSomethingWentWrong);
      }
    });

    flutterTts.setCancelHandler(() async {
      /*await Future.delayed(Duration(milliseconds: 200));

      finish(context);
      toast(errorSomethingWentWrong);*/
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        ttsState = TtsState.continued;
      });
    });

    await Future.delayed(Duration(milliseconds: 300));
    speak();
  }

  Future speak() async {
    currentWordPosition = 0;
    progress = 0;

    animationController.forward();

    var result = await flutterTts.speak(widget.text);

    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future stop() async {
    currentWordPosition = 0;
    progress = 0;

    animationController.reverse();

    var result = await flutterTts.stop();

    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts?.stop();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          cachedImage(
            'https://3.bp.blogspot.com/-BogykpVgXv8/WYeJk--8xOI/AAAAAAAACWk/GORfjYPnTMoeeMH7uV61H0SPBy02j4ERACLcBGAs/s1600/Relaxing%2BQuotes%2Bwww.mostphrases.blogspot.com.jpg',
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(defaultRadius).opacity(opacity: 0.7),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text('${ttsState == TtsState.playing ? 'Playing' : 'Stopped'}', style: boldTextStyle()),
                  //30.width,
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      onPressed: () {
                        ttsState == TtsState.playing ? stop() : speak();
                      },
                      icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: animationController, color: Colors.black),
                    ),
                  ),
                  16.width,
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), borderRadius: radius(defaultRadius)),
                        alignment: Alignment.centerLeft,
                        width: 200,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 800),
                        height: 10,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: radius(defaultRadius)),
                        alignment: Alignment.centerLeft,
                        width: (progress * 2).toDouble(),
                      ),
                    ],
                  ),
                  //8.width,
                  //Text('$progress%', style: boldTextStyle(size: 20)),
                ],
              ),
              30.height,
            ],
          ),
          Positioned(child: CloseButton(), top: 16, right: 16),
        ],
      ),
    );
  }
}

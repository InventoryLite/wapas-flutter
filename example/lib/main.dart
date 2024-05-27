import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wapas/models/achievement_model.dart';
import 'package:wapas/models/config_model.dart';
import 'package:wapas/models/user_achievement_list_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas_example/add_partner_screen.dart';

// TODO : Add your crdentials
const applicationId = "";
const clientId = "";
const clientSecret = "";
const version = "";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _wapasPlugin = Wapas();
  final navigatorKey = GlobalKey<NavigatorState>();

  AchievementModel? _achievement;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    initPlatformState();
    initWapas();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _wapasPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  initWapas() async {
    Config config = Config(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret,
        version: version);
    UserAchievementListModel? achievementsList;
    try {
      await _wapasPlugin.init(config!); // initialize the library
      achievementsList = await _wapasPlugin.getUnacknowledgedAchievements(
        "662f7997704a55d1820cd8ee",
      ); // get all achievements
    } on PlatformException {
      // Log exception and report studio@gameolive.com
    }

    if (achievementsList!.rows != null) {
      if (achievementsList!.rows!.isNotEmpty) {
        if (achievementsList!.rows![0].achievement != null) {
          setState(() {
            _achievement = achievementsList!.rows![0].achievement;
          });

          showAchievement(navigatorKey.currentContext!);
        }
      }
    }
  }

  showAchievement(BuildContext context) {
    _confettiController.play();
    showDialog(
      context: context,
      builder: (BuildContext context) => Align(
        alignment: Alignment.center,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 240,
              height: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        navigatorKey.currentState!.pop();
                        _confettiController.stop();
                      },
                      child: Icon(Icons.close),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    _achievement!.title.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Plugin example app'),
              ),
              ListTile(
                title: const Text('Add Partner'),
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => AddPartnerScreen(
                        wapasPlugin: _wapasPlugin,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: _achievement != null
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      // don't specify a direction, blast randomly
                      shouldLoop: true,
                      // start again as soon as the animation is finished
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ],
                      // manually specify the colors to be used
                      createParticlePath: drawStar,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_achievement!.title.toString()),
                        Builder(
                          builder: (context) => ElevatedButton(
                            onPressed: () {
                              showAchievement(context);
                            },
                            child: Text('Show Achievement'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: Text('Running on: $_platformVersion\n'),
              ),
      ),
    );
  }
}

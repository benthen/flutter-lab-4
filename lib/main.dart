import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dice Game',
      home: MyHomePage(title: 'Dice Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var images = [
    "assets/images/dice1@2x.png",
    "assets/images/dice2@2x.png",
    "assets/images/dice3@2x.png",
    "assets/images/dice4@2x.png",
    "assets/images/dice5@2x.png",
    "assets/images/dice6@2x.png",
  ];
  bool displayImage = false;
  final _random = Random();
  dynamic showImage1;
  dynamic showImage2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/newbackground@2x.png"), fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 80),
                Image.asset("assets/images/diceeLogo@2x.png",
                    width: 500, height: 200),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    displayImage
                        ? Container(
                            child: Image.asset(showImage1.toString(),
                                width: 150, height: 150),
                          )
                        : Image.asset("assets/images/dice1@2x.png",
                            width: 150, height: 150),
                    const SizedBox(
                      width: 20,
                    ),
                    displayImage
                        ? Container(
                            child: Image.asset(showImage2.toString(),
                                width: 150, height: 150),
                          )
                        : Image.asset("assets/images/dice1@2x.png",
                            width: 150, height: 150),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    setState(() {
                      displayImage = true;
                      showImage1 = images[_random.nextInt(images.length)];
                      showImage2 = images[_random.nextInt(images.length)];
                    });
                  },
                  child: const Text(
                    "Button",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

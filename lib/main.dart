import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _time = 60;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  void _setTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_time > 0) {
          setState(() {
            _time--;
          });
        }
      },
    );
  }

  void _resetTimer() {
    _timer.cancel();
    _time = 60;
    _setTimer();
  }

  void _addSeconds() {
    if (!_timer.isActive) {
      _resetTimer();
    }
    _time += 60;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Timer app'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            '$_time',
            style: const TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: _resetTimer,
              child: const Icon(Icons.restore),
            ),
            FloatingActionButton(
              onPressed: _timer.cancel,
              child: const Icon(Icons.pan_tool),
            ),
            FloatingActionButton(
              onPressed: _addSeconds,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

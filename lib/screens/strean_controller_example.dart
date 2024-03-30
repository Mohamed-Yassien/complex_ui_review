import 'dart:async';

import 'package:flutter/material.dart';

class StreamControllerExampleScreen extends StatefulWidget {
  const StreamControllerExampleScreen({super.key});

  @override
  State<StreamControllerExampleScreen> createState() =>
      _StreamControllerExampleScreenState();
}

class _StreamControllerExampleScreenState
    extends State<StreamControllerExampleScreen> {
  final StreamController<int> _controller = StreamController<int>();
  int _counter = 0;
  late StreamSubscription<int> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _controller.stream.listen((int count) {
      setState(() {
        _counter = count;
      });
    });

    // Start incrementing the counter every second
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _controller.sink.add(_counter + 1);
    });
  }

  @override
  void dispose() {
    _controller.close();
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.isPaused ? _subscription.resume() : _subscription.pause();
          setState(() {});
        },
        child: Icon(
          _controller.isPaused ? Icons.play_arrow : Icons.stop,
          size: 40,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Stream Controller Example',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter:',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

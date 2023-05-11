import 'dart:async';

import 'package:flutter/material.dart';
import 'package:future_stream_example/utils/k_log.dart';

import '../../utils/number_behavior.dart';

class BehaviorPage extends StatefulWidget {
  BehaviorPage({Key? key}) : super(key: key);

  @override
  State<BehaviorPage> createState() => _BehaviorPageState();
}

class _BehaviorPageState extends State<BehaviorPage> {
  final _numberBehavior = NumberBehavior();
  StreamSubscription<int>? _listen;

  @override
  void initState() {
    super.initState();

    _listen = _numberBehavior.numberStream.listen((event) {
      KLog.d('listen data $event');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Behavior Example')),
      body: StreamBuilder<int>(
        stream: NumberBehavior().numberStream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('current number'),
              Text('${snapshot.data}'),
              snapshot.data == null
                  ? const Text('no value')
                  : ElevatedButton(
                      onPressed: () {
                        _numberBehavior.setNumber(snapshot.data! * 2);
                      },
                      child: const Text('x 2'),
                    ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _listen?.cancel();
    super.dispose();
  }
}

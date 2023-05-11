import 'package:flutter/material.dart';
import 'package:future_stream_example/page/behavior_subject/behavior_page.dart';
import 'package:future_stream_example/page/builder_example/builder_example_page.dart';

import 'page/future_cancel/future_blocking_page.dart';
import 'page/future_cancel/future_cancel_page.dart';

const appTitle = 'Future, Stream Example';

const appTextStyle = TextStyle();

void main() {
  runApp(
    const MaterialApp(
      title: appTitle,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const BuilderExamplePage()));
                },
                child: const Text('Future & Stream Builder Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const FutureCancelPage()));
                },
                child: const Text('Future Cancel Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const FutureBlockingPage()));
                },
                child: const Text('Future Blocking Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => BehaviorPage()));
                },
                child: const Text('Behavior(stream) Example')),
          ],
        ),
      ),
    );
  }
}

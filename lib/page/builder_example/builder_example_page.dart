import 'package:flutter/material.dart';

import 'future_builder_example.dart';
import 'stream_builder_example.dart';

class BuilderExamplePage extends StatefulWidget {
  const BuilderExamplePage({Key? key}) : super(key: key);

  @override
  State<BuilderExamplePage> createState() => _BuilderExamplePageState();
}

class _BuilderExamplePageState extends State<BuilderExamplePage> {
  bool isFuture = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isFuture
                ? FutureBuilderExample(onPressed: startSetState)
                : StreamBuilderExample(onPressed: startSetState),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFuture = !isFuture;
                });
              },
              child: Text('Change Mode'),
            ),
          ],
        ),
      ),
    );
  }

  startSetState() {
    setState(() {});
  }
}

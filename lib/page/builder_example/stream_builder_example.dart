import 'package:flutter/material.dart';

class StreamBuilderExample extends StatelessWidget {
  const StreamBuilderExample({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: streamNumbers(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('StreamBuilder'),
            Text('ConState : ${snapshot.connectionState}'),
            Text('Data : ${snapshot.data}'),
            Text('Error: ${snapshot.error}'),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('setState'),
            ),
          ],
        );
      },
    );
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 500));

      if (i == 5) {
        throw Exception('(rand = 5)이 발생했습니다.');
      }

      yield i;
    }
  }
}

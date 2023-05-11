import 'dart:math';

import 'package:flutter/material.dart';
import 'package:future_stream_example/utils/k_log.dart';

class FutureBuilderExample extends StatelessWidget {
  final VoidCallback onPressed;

  const FutureBuilderExample({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getFutureNumber(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // 데이터가 있을떄 랜더링
        }

        if (snapshot.hasError) {
          // 에러가 났을 떄 위젯 렌더링
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('FutureBuilder'),
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

  Future<int> getFutureNumber() async {
    await Future.delayed(Duration(milliseconds: 500));

    final random = Random().nextInt(10);

    KLog.d('$random');
    if (random == 5) {
      throw Exception('(rand = 5)이 발생했습니다.');
    } else {
      return random;
    }
  }
}

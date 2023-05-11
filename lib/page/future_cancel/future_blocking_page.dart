import 'package:flutter/material.dart';

import 'blocking_tap_gesture_detector.dart';

class FutureBlockingPage extends StatefulWidget {
  const FutureBlockingPage({Key? key}) : super(key: key);

  @override
  State<FutureBlockingPage> createState() => _FutureBlockingPageState();
}

class _FutureBlockingPageState extends State<FutureBlockingPage> {
  final List<int> _indexList = List.generate(12, (index) => index);
  final _titleStyle = const TextStyle(fontSize: 20, color: Colors.black);
  final _textStyle = const TextStyle(fontSize: 15, color: Colors.indigo);
  String _blockText = '';
  String _commonText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Blocking Example')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _baseContainer(child: _commonBody(), color: Colors.black12)),
            Expanded(child: _baseContainer(child: _blockBody(), color: Colors.black12)),
          ],
        ));
  }

  Widget _commonBody() {
    return Column(
      children: [
        Text('Common', style: _titleStyle),
        _baseContainer(
          child: Text(_commonText, style: _textStyle),
          color: Colors.white,
        ),
        Expanded(
          child: _referGrid(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _commonText += '<$index>';
                  });
                },
                child: _baseContainer(child: Text('$index', style: _textStyle)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _blockBody() {
    return Column(
      children: [
        Text('Blocking', style: _titleStyle),
        _baseContainer(
          child: Text(_blockText, style: _textStyle),
          color: Colors.white,
        ),
        Expanded(
          child: _referGrid(
            itemBuilder: (context, index) {
              return BlockingTapGestureDetector(
                description: 'Button <$index>',
                onTap: () {
                  setState(() {
                    _blockText += '<$index>';
                  });
                },
                child: _baseContainer(child: Text('$index', style: _textStyle)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _referGrid({required IndexedWidgetBuilder itemBuilder}) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      scrollDirection: Axis.vertical,
      itemCount: _indexList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: itemBuilder,
    );
  }

  Widget _baseContainer({required Widget child, Color color = Colors.grey}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        // padding: const EdgeInsets.all(10.0),
        child: Center(child: child),
      ),
    );
  }
}

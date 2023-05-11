import 'package:flutter/material.dart';
import 'package:async/async.dart';

class FutureCancelPage extends StatefulWidget {
  const FutureCancelPage({Key? key}) : super(key: key);

  @override
  State<FutureCancelPage> createState() => _FutureCancelPageState();
}

class _FutureCancelPageState extends State<FutureCancelPage> {
  String? _text;
  bool _isLoading = false;
  CancelableOperation? _myCancelableFuture;

  Future<String?> _myFuture() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return 'Complete';
  }

  void _getData() async {
    setState(() {
      _isLoading = true;
    });

    _myCancelableFuture = CancelableOperation.fromFuture(
      _myFuture(),
      onCancel: () => 'Cancel',
    );
    final value = await _myCancelableFuture?.value;

    setState(() {
      _text = value;
      _isLoading = false;
    });
  }

  void _cancelFuture() async {
    final result = await _myCancelableFuture?.cancel();
    setState(() {
      _text = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Cancel Example')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Text(_text ?? 'Press Start Button', style: const TextStyle(fontSize: 28)),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => _isLoading ? _cancelFuture() : _getData(),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            foregroundColor: _isLoading ? Colors.red : Colors.white),
        child: Text(_isLoading ? 'Cancel' : 'Start'),
      ),
    );
  }
}

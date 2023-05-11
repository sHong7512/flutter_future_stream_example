import 'dart:async';

import 'package:rxdart/rxdart.dart';

class NumberBehavior{
  static final NumberBehavior _instance = NumberBehavior._internal();

  factory NumberBehavior() => _instance;

  NumberBehavior._internal();

  BehaviorSubject<int> numberController = BehaviorSubject.seeded(1);
  Stream<int> get numberStream => numberController.stream;

  setNumber(int number){
    numberController.add(number);
  }

}
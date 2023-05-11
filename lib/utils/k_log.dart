import 'package:flutter/foundation.dart';

class KLog{
  static const String TAG = 'sHong] ';

  static d(String str){
    if(kDebugMode) print(TAG + str);
  }
}
import 'package:flutter/foundation.dart';

class Temperature with ChangeNotifier {
  String _temperatureType = 'celcius';
  int _temperature = 25;

  String get temperatureType => _temperatureType;

  int get temperature => _temperature;

  set temperatureType(String type) {
    this._temperatureType = type;
    notifyListeners();
  }

  set temperature(int temp) {
    this._temperature = temp;
    notifyListeners();
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class CircleProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  dynamic diameterValue = 0;
  double area = 0;
  double perimeter = 0;
  bool _canShow = false;

  validateFrom() {
    if (formKey.currentState!.validate()) {
      calculateArea();
      calculatePerimeter();
      canShow = true;
      return true;
    } else {
      return false;
    }
  }

  calculateArea() {
    double radio = double.parse(diameterValue) / 2;
    area = 3.1416 * pow(radio, 2);
  }

  calculatePerimeter() {
    perimeter = double.parse(diameterValue) * 3.1416;
  }

  bool get canShow => _canShow;
  set canShow(bool value) {
    _canShow = value;
    notifyListeners();
  }
}

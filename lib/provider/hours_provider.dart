import 'package:flutter/material.dart';

class HoursProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  dynamic horasTotales = 0;
  dynamic salary;

  validateFrom() {
    if (formKey.currentState!.validate()) {
      calculateSalary();
      return true;
    } else {
      return false;
    }
  }

  calculateSalary() {
    double horas = double.parse(horasTotales) - 40;
    if (horas > 0) {
      double extra = horas * 15;
      double suma = 40 * 10;

      salary = suma + extra;
    } else {
      salary = double.parse(horasTotales) * 10;
    }
  }
}

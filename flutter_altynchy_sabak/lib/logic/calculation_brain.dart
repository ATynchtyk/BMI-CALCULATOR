import 'dart:math';

class CalculationBrain {
  CalculationBrain({this.height, this.weight});
  final double height;
  final double weight;

  double _bmi;

  void calculateBMI(double h, double w) {
    _bmi = w / pow(h / 100, 2);
  }

  String getResultNumber() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Ашыкча Салмак';
    } else if (_bmi > 18.5) {
      return 'Нормалдуу';
    } else {
      return 'Арыксыз';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Сиздин дене салмагыңыз нормадан жогору. Кобурөөк машыгууга аракет кылыңыз.';
    } else if (_bmi >= 18.5) {
      return 'Сиздин дене салмагыңыз нормалдуу.Эң сонун!';
    } else {
      return 'Сиздин дене салмагыңыз нормадан төмөн. Сиз дагы бир аз көп  тамак жеңиз.';
    }
  }
}

final CalculationBrain calculationBrain = CalculationBrain();

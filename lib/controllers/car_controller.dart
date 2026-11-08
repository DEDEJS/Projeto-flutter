import 'package:flutter/material.dart';

class Car {
  final String brand;
  final String model;
  final String year;
  final String plate;

  Car({required this.brand, required this.model, required this.year, required this.plate});
}

class CarController extends ChangeNotifier {
  final List<Car> _cars = [];

  List<Car> get cars => List.unmodifiable(_cars);

  bool addCar({
    required String brand,
    required String model,
    required String year,
    required String plate,
  }) {
    if (brand.isNotEmpty && model.isNotEmpty && year.isNotEmpty && plate.isNotEmpty) {
      _cars.add(Car(brand: brand, model: model, year: year, plate: plate));
      notifyListeners();
      return true;
    }
    return false;
  }
}

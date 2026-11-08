import 'package:flutter/material.dart';
import '../controllers/car_controller.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.directions_car, color: Colors.white),
        ),
        title: Text(
          '${car.brand.toUpperCase()} - ${car.model}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Ano: ${car.year} | Placa: ${car.plate.toUpperCase()}'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}

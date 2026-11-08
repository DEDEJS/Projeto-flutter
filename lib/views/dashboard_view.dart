import 'package:flutter/material.dart';
import '../controllers/car_controller.dart';
import '../widgets/car_card.dart';
import 'car_form_view.dart';

final carControllerGlobal = CarController();

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    carControllerGlobal.addListener(_updateScreen);
  }

  @override
  void dispose() {
    carControllerGlobal.removeListener(_updateScreen);
    super.dispose();
  }

  void _updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final cars = carControllerGlobal.cars;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Carros'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          )
        ],
      ),
      body: cars.isEmpty
          ? const Center(
              child: Text(
                'Nenhum carro cadastrado.\nToque no botão "+" para adicionar!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: cars[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CarFormView()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

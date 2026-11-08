import 'package:flutter/material.dart';
import 'dashboard_view.dart';

class CarFormView extends StatefulWidget {
  const CarFormView({super.key});

  @override
  State<CarFormView> createState() => _CarFormViewState();
}

class _CarFormViewState extends State<CarFormView> {
  final _brandCtrl = TextEditingController();
  final _modelCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();
  final _plateCtrl = TextEditingController();

  @override
  void dispose() {
    _brandCtrl.dispose();
    _modelCtrl.dispose();
    _yearCtrl.dispose();
    _plateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Novo Carro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _brandCtrl,
              decoration: const InputDecoration(labelText: 'Marca', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _modelCtrl,
              decoration: const InputDecoration(labelText: 'Modelo', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _yearCtrl,
              decoration: const InputDecoration(labelText: 'Ano', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _plateCtrl,
              decoration: const InputDecoration(labelText: 'Placa', border: OutlineInputBorder()),
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                onPressed: () {
                  final success = carControllerGlobal.addCar(
                    brand: _brandCtrl.text,
                    model: _modelCtrl.text,
                    year: _yearCtrl.text,
                    plate: _plateCtrl.text,
                  );

                  if (success) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Carro adicionado com sucesso!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, preencha todos os campos.')),
                    );
                  }
                },
                child: const Text('Cadastrar Carro', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

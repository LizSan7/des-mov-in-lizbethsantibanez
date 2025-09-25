import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final int counter;
  const SecondPage({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Pantalla')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are in second page'),
            Text('Valor de counter: $counter', style: const TextStyle(fontSize: 17)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar a la pantalla principal'),
            ),
          ],
        ),
      ),
    );
  }
}

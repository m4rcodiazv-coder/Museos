import 'package:flutter/material.dart';

class DetalleSalaPage extends StatelessWidget {
  final String nombreSala;

  const DetalleSalaPage({super.key, required this.nombreSala});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombreSala),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.museum,
                size: 80,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 16),
              Text(
                'Bienvenido a la sala:\n$nombreSala',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
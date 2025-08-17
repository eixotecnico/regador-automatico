import 'package:flutter/material.dart';

class PaginaDestino extends StatelessWidget {
  final String titulo;

  const PaginaDestino(this.titulo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      backgroundColor: const Color(0xFF015A84),
      body: Center(
        child: Text('Página: $titulo', style: const TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }
}
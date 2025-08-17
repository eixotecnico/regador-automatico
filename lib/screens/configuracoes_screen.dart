import 'package:flutter/material.dart';

class TelaConfiguracoes extends StatelessWidget {
  const TelaConfiguracoes({super.key});

  @override
  Widget build(BuildContext context) {
    final opcoes = [
      'Modo Escuro',
      'Backup',
      'Aplicativo Web',
      'Escreva uma avaliação',
      'Contate-nos',
      'Torne-se um testador',
      'Sobre',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: opcoes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(opcoes[index], style: const TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
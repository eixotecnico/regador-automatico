import 'package:flutter/material.dart';
import 'configuracoes_notificacoes_screen.dart';

class TelaNotificacoes extends StatelessWidget {
  const TelaNotificacoes({super.key});

  @override
  Widget build(BuildContext context) {
    final notificacoes = [
      'Alface foi irrigada às 08:00',
      'Tomate atingiu 28°C às 12:30',
      'Milho está com baixa umidade',
      'Cenoura recebeu luz solar suficiente',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TelaConfiguracoesNotificacoes()),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: notificacoes.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white),
            title: Text(notificacoes[index], style: const TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
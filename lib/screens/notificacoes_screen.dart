import 'package:flutter/material.dart';
import 'configuracoes_notificacoes_screen.dart';

class TelaNotificacoes extends StatelessWidget {
  const TelaNotificacoes({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Isso futuramente virá do BD (Firestore, SQLite, etc.)
    final notificacoes = [
      {
        'tipo': 'irrigacao',
        'mensagem': 'Alface foi irrigada',
        'hora': '08:00'
      },
      {
        'tipo': 'temperatura',
        'mensagem': 'Tomate atingiu 28°C',
        'hora': '12:30'
      },
      {
        'tipo': 'umidade',
        'mensagem': 'Milho está com baixa umidade',
        'hora': '14:10'
      },
      {
        'tipo': 'luz',
        'mensagem': 'Cenoura recebeu luz solar suficiente',
        'hora': '16:45'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF015A84),
      appBar: AppBar(
        backgroundColor: const Color(0xFF015A84),
        elevation: 0,
        title: const Text(
          'Notificações',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TelaConfiguracoesNotificacoes(),
                ),
              );
            },
          ),
        ],
      ),
      body: notificacoes.isEmpty
          ? const Center(
              child: Text(
                "Nenhuma notificação ainda",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: notificacoes.length,
              itemBuilder: (context, index) {
                final item = notificacoes[index];
                final tipo = item['tipo'];
                final mensagem = item['mensagem'];
                final hora = item['hora'];

                // 🔹 Escolhe ícone de acordo com o tipo
                IconData icone;
                Color corIcone;
                switch (tipo) {
                  case 'irrigacao':
                    icone = Icons.water_drop;
                    corIcone = Colors.blueAccent;
                    break;
                  case 'temperatura':
                    icone = Icons.thermostat;
                    corIcone = Colors.redAccent;
                    break;
                  case 'umidade':
                    icone = Icons.eco;
                    corIcone = Colors.orangeAccent;
                    break;
                  case 'luz':
                    icone = Icons.wb_sunny;
                    corIcone = Colors.yellowAccent;
                    break;
                  default:
                    icone = Icons.notifications;
                    corIcone = Colors.white;
                }

                return Card(
                  color: Colors.white.withOpacity(0.1),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: Icon(icone, color: corIcone),
                    title: Text(
                      mensagem!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      hora!,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

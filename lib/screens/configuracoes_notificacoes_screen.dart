import 'package:flutter/material.dart';

class TelaConfiguracoesNotificacoes extends StatelessWidget {
  const TelaConfiguracoesNotificacoes({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> temperaturas = [20, 25, 28, 30, 35];
    final List<int> umidades = [40, 50, 60, 70, 80];
    final List<int> luminosidades = [100, 200, 300, 400, 500];

    return Scaffold(
      appBar: AppBar(title: const Text('Configurações de Notificações')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: 'Notificar ao atingir temperatura'),
              items: temperaturas.map((t) => DropdownMenuItem(value: t, child: Text('$t°C'))).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: 'Notificar ao atingir umidade'),
              items: umidades.map((u) => DropdownMenuItem(value: u, child: Text('$u%'))).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: 'Notificar ao atingir luminosidade'),
              items: luminosidades.map((l) => DropdownMenuItem(value: l, child: Text('$l lux'))).toList(),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
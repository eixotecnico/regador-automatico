import 'package:flutter/material.dart';

class TelaRelatorio extends StatelessWidget {
  const TelaRelatorio({super.key});

  // Exemplo de dados de relatório
  final List<Map<String, String>> historico = const [
    {
      "data": "01/09/2025",
      "horario": "08:00",
      "status": "Concluído",
      "duracao": "15 min",
    },
    {
      "data": "02/09/2025",
      "horario": "14:30",
      "status": "Concluído",
      "duracao": "20 min",
    },
    {
      "data": "03/09/2025",
      "horario": "09:00",
      "status": "Interrompido",
      "duracao": "5 min",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Relatório de Irrigação"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: historico.length,
          itemBuilder: (context, index) {
            final item = historico[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.blue[50],
              child: ListTile(
                leading: Icon(
                  item["status"] == "Concluído"
                      ? Icons.check_circle
                      : Icons.error,
                  color: item["status"] == "Concluído"
                      ? Colors.green
                      : Colors.red,
                  size: 32,
                ),
                title: Text(
                  "${item["data"]} - ${item["horario"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Status: ${item["status"]}\nDuração: ${item["duracao"]}",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

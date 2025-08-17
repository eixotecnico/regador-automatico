import 'package:flutter/material.dart';
import '../widgets/menu_button.dart';
import 'pagina_destino.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF015A84),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Automação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card de status (AQUI É ÍCONE)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF016A9B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.water_drop, // ÍCONE no card de status
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Desligado",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Próxima irrigação\n12:00h",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            MenuButton(
              imagePath: "assets/images/automacao/iniciar.png",
              text: "Iniciar irrigação",
              destino: const PaginaDestino("Iniciar Irrigação"),
            ),
            MenuButton(
              imagePath: "assets/images/automacao/interromper.png",
              text: "Interromper irrigação",
              destino: const PaginaDestino("Interromper Irrigação"),
            ),
            MenuButton(
              imagePath: "assets/images/automacao/horario.png",
              text: "Definir horários de Irrigação",
              destino: const PaginaDestino("Definir Horários de Irrigação"),
            ),
            MenuButton(
              imagePath: "assets/images/automacao/graficos.png",
              text: "Gráficos",
              destino: const PaginaDestino("Gráficos"),
            ),
            MenuButton(
              imagePath: "assets/images/automacao/relatorio.png",
              text: "Relatório",
              destino: const PaginaDestino("Relatórios"),
            ),
          ],
        ),
      ),
    );
  }
}
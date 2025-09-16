import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaDefinirHorarios extends StatefulWidget {
  const TelaDefinirHorarios({super.key});

  @override
  State<TelaDefinirHorarios> createState() => _TelaDefinirHorariosState();
}

class _TelaDefinirHorariosState extends State<TelaDefinirHorarios> {
  List<TimeOfDay> horarios = [];

  @override
  void initState() {
    super.initState();
    _carregarHorarios();
  }

  Future<void> _carregarHorarios() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? listaSalva = prefs.getStringList("horarios");

    if (listaSalva != null) {
      setState(() {
        horarios = listaSalva.map((h) {
          final partes = h.split(":");
          return TimeOfDay(
            hour: int.parse(partes[0]),
            minute: int.parse(partes[1]),
          );
        }).toList();
      });
    }
  }

  Future<void> _salvarHorarios() async {
    final prefs = await SharedPreferences.getInstance();
    final listaStr = horarios.map((h) => "${h.hour}:${h.minute}").toList();
    await prefs.setStringList("horarios", listaStr);
  }

  Future<void> _adicionarHorario() async {
    final TimeOfDay? novoHorario = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (novoHorario != null) {
      setState(() {
        horarios.add(novoHorario);
        horarios.sort((a, b) => a.hour.compareTo(b.hour) != 0
            ? a.hour.compareTo(b.hour)
            : a.minute.compareTo(b.minute));
      });
      _salvarHorarios();
    }
  }

  void _removerHorario(int index) {
    setState(() {
      horarios.removeAt(index);
    });
    _salvarHorarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF015A84),
      appBar: AppBar(
        title: const Text("Definir Horários de Irrigação"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: horarios.isEmpty
                  ? const Center(
                      child: Text(
                        "Nenhum horário definido",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: horarios.length,
                      itemBuilder: (context, index) {
                        final horario = horarios[index];
                        return Card(
                          color: const Color(0xFF016A9B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.schedule, color: Colors.white),
                            title: Text(
                              horario.format(context),
                              style: const TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removerHorario(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add, size: 28),
                label: const Text(
                  "Adicionar horário",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: _adicionarHorario,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'adicionar_planta_screen.dart';
import 'detalhe_planta_screen.dart';
import 'notificacoes_screen.dart';
import 'configuracoes_screen.dart';

class TelaPlantas extends StatefulWidget {
  const TelaPlantas({super.key});

  @override
  State<TelaPlantas> createState() => _TelaPlantasState();
}

class _TelaPlantasState extends State<TelaPlantas> {
  List<Map<String, String>> plantas = [];

  final Map<String, String> mapaImagens = {
    'Alface': 'assets/images/plantas/alface.png',
    'Tomate': 'assets/images/plantas/tomate.png',
    'Milho': 'assets/images/plantas/milho.png',
    'Cenoura': 'assets/images/plantas/cenoura.png',
    'Maçã': 'assets/images/plantas/maca.png',
    'Morango': 'assets/images/plantas/morango.png',
    'Pepino': 'assets/images/plantas/pepino.png',
  };

  void _adicionarOuEditarPlanta({Map<String, String>? plantaExistente, int? index}) async {
    final novaPlanta = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (_) => AdicionarPlantaScreen(plantaExistente: plantaExistente),
        fullscreenDialog: true,
      ),
    );
    if (novaPlanta != null) {
      setState(() {
        if (index != null) {
          plantas[index] = novaPlanta;
        } else {
          plantas.add(novaPlanta);
        }
      });
    }
  }

  void _deletarPlanta(int index) {
    setState(() {
      plantas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TelaNotificacoes()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF015A84),
        child: Column(
          children: [
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 80,
              backgroundImage: const AssetImage('assets/images/perfil_padrao.png'),
            ),
            const SizedBox(height: 16),
            const Text('Usuário', style: TextStyle(color: Colors.white, fontSize: 24)),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Configurações', style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TelaConfiguracoes()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: plantas.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma planta adicionada',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: plantas.length,
              itemBuilder: (context, index) {
                final planta = plantas[index];
                final imagemPlanta = mapaImagens[planta['nome']] ?? 'assets/images/planta_padrao.png';
                return Card(
                  color: const Color(0xFF016A9B),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(imagemPlanta, height: 40, width: 40),
                    title: Text(planta['nome'] ?? '', style: const TextStyle(color: Colors.white)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () => _adicionarOuEditarPlanta(plantaExistente: planta, index: index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () => _deletarPlanta(index),
                        ),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TelaDetalhePlanta(
                            nomePlanta: planta['nome'] ?? '',
                            caminhoImagem: imagemPlanta,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarOuEditarPlanta(),
        backgroundColor: const Color(0xFF096591),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
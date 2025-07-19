import 'package:flutter/material.dart';

void main() {
  runApp(const RegadorApp());
}

class RegadorApp extends StatelessWidget {
  const RegadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Regador Automático',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF015A84),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF015A84),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const TelaPlantas(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaPlantas extends StatelessWidget {
  const TelaPlantas({super.key});

  final List<String> plantas = const ['Alface', 'Tomate', 'Milho', 'Cenoura'];

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
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF016A9B)),
              child: Text(
                'Menu Lateral',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.water, color: Colors.white),
              title: Text('Irrigação', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Configurações', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: ListView(
        children: plantas.map((planta) {
          return Card(
            color: const Color(0xFF016A9B),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(planta, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TelaDetalhePlanta(nomePlanta: planta)),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TelaDetalhePlanta extends StatelessWidget {
  final String nomePlanta;

  const TelaDetalhePlanta({super.key, required this.nomePlanta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomePlanta),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('lib/images/${nomePlanta.toLowerCase()}.png', height: 120),
            const SizedBox(height: 16),
            const Text('Temperatura: 25°C', style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 8),
            const Text('Umidade: 60%', style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 8),
            const Text('Luminosidade: 300 lux', style: TextStyle(fontSize: 20, color: Colors.white)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TelaPrincipal()),
                );
              },
              child: const Text('Automação'),
            ),
          ],
        ),
      ),
    );
  }
}

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
      ),
      body: ListView.separated(
        itemCount: notificacoes.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white),
            title: Text(
              notificacoes[index],
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Automação da Cenoura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OpcaoMenuComImagem(
              texto: 'Iniciar Irrigação',
              imagens: ['lib/images/regador.png', 'lib/images/agua.png'],
              destino: const PaginaDestino('Iniciar Irrigação'),
            ),
            OpcaoMenuComImagem(
              texto: 'Interromper Irrigação',
              imagens: ['lib/images/regador.png', 'lib/images/x.png'],
              destino: const PaginaDestino('Interromper Irrigação'),
            ),
            OpcaoMenuComImagem(
              texto: 'Definir Horário de Irrigação',
              imagens: ['lib/images/horario.png'],
              destino: const PaginaDestino('Definir Horário de Irrigação'),
            ),
            OpcaoMenuComImagem(
              texto: 'Gráficos',
              imagens: ['lib/images/g1.png', 'lib/images/g2.png', 'lib/images/g3.png'],
              destino: const PaginaDestino('Gráficos'),
            ),
            OpcaoMenuComImagem(
              texto: 'Relatórios',
              imagens: ['lib/images/relatorio.png'],
              destino: const PaginaDestino('Relatórios'),
            ),
          ],
        ),
      ),
    );
  }
}

class OpcaoMenuComImagem extends StatelessWidget {
  final String texto;
  final List<String> imagens;
  final Widget destino;

  const OpcaoMenuComImagem({
    super.key,
    required this.texto,
    required this.imagens,
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF016A9B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: imagens.map((path) => Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Image.asset(path, height: 24, width: 24),
          )).toList(),
        ),
        title: Text(texto, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destino),
          );
        },
      ),
    );
  }
}

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

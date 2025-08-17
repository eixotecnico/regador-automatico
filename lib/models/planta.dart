class Planta {
  final String nome;
  final String localizacao;
  final String? caminhoImagem;
  final double? temperatura;
  final double? umidade;
  final String? luminosidade;

  Planta({
    required this.nome,
    required this.localizacao,
    this.caminhoImagem,
    this.temperatura,
    this.umidade,
    this.luminosidade,
  });

  // Construtor para criar uma planta a partir de um Map
  factory Planta.fromMap(Map<String, String> map) {
    return Planta(
      nome: map['nome'] ?? '',
      localizacao: map['localizacao'] ?? '',
      caminhoImagem: map['caminhoImagem'],
    );
  }

  // Método para converter a planta em um Map
  Map<String, String> toMap() {
    return {
      'nome': nome,
      'localizacao': localizacao,
      if (caminhoImagem != null) 'caminhoImagem': caminhoImagem!,
    };
  }

  // Método para criar uma cópia da planta com valores atualizados
  Planta copyWith({
    String? nome,
    String? localizacao,
    String? caminhoImagem,
    double? temperatura,
    double? umidade,
    String? luminosidade,
  }) {
    return Planta(
      nome: nome ?? this.nome,
      localizacao: localizacao ?? this.localizacao,
      caminhoImagem: caminhoImagem ?? this.caminhoImagem,
      temperatura: temperatura ?? this.temperatura,
      umidade: umidade ?? this.umidade,
      luminosidade: luminosidade ?? this.luminosidade,
    );
  }

  @override
  String toString() {
    return 'Planta(nome: $nome, localizacao: $localizacao, caminhoImagem: $caminhoImagem)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Planta &&
        other.nome == nome &&
        other.localizacao == localizacao &&
        other.caminhoImagem == caminhoImagem;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ localizacao.hashCode ^ caminhoImagem.hashCode;
  }
}
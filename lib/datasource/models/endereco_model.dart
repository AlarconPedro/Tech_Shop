class EnderecoModel {
  String endereco;
  String bairro;
  String numero;

  EnderecoModel({
    required this.endereco,
    required this.numero,
    required this.bairro,
  });

  factory EnderecoModel.fromJson(Map<String, dynamic> json) => EnderecoModel(
        endereco: json["logradouro"],
        numero: json["numero"],
        bairro: json["bairro"],
      );
}

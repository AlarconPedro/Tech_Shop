class EnderecoModel {
  String endereco;
  String numero;

  EnderecoModel({
    required this.endereco,
    required this.numero,
  });

  factory EnderecoModel.fromJson(Map<String, dynamic> json) => EnderecoModel(
        endereco: json["logradouro"],
        numero: json["numero"],
      );
}

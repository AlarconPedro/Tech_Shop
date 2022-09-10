class CadastroEnderecoModel {
  String cep;
  String logradouro;
  String? complemento;
  String bairro;
  String cidade;
  String uf;
  int numero;
  int clienteId;

  CadastroEnderecoModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.numero,
    required this.clienteId,
    this.complemento,
  });

  factory CadastroEnderecoModel.fromJson(Map<String, dynamic> json) =>
      CadastroEnderecoModel(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        cidade: json["cidade"],
        uf: json["uf"],
        numero: json["numero"],
        clienteId: json["clienteId"],
      );
}

class LoginModel {
  int? id;
  String nome;
  String cpf;
  String telefone;
  String dataNascimento;
  String email;
  String? senha;

  LoginModel({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.dataNascimento,
    required this.email,
    required this.senha,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        nome: json["nome"],
        cpf: json["cpf"],
        telefone: json["telefone"],
        email: json["email"],
        senha: json["senha"],
        dataNascimento: json["data_nascimento"],
      );
}

class LoginModel {
  String nome;
  String cpf;
  String dataNascimento;
  String email;
  String senha;

  LoginModel({
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
    required this.email,
    required this.senha,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        nome: json["nome"],
        cpf: json["cpf"],
        email: json["email"],
        senha: json["senha"],
        dataNascimento: json["data_nascimento"],
      );
}

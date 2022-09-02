class ImagensModel {
  String imagem1;
  String imagem2;
  String imagem3;
  String imagem4;
  String imagem5;

  ImagensModel({
    required this.imagem1,
    required this.imagem2,
    required this.imagem3,
    required this.imagem4,
    required this.imagem5,
  });

  factory ImagensModel.fromJson(Map<String, dynamic> json) {
    return ImagensModel(
      imagem1: json['imagem1'],
      imagem2: json['imagem2'],
      imagem3: json['imagem3'],
      imagem4: json['imagem4'],
      imagem5: json['imagem5'],
    );
  }
}

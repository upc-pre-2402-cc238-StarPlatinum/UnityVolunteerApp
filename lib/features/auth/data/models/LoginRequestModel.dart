class LoginModel {
  final String correo;
  final String contrasena;

  LoginModel({
    required this.correo,
    required this.contrasena,
  });

  // Convertir de JSON a modelo de datos
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      correo: json['correo'],
      contrasena: json['contrasena'],
    );
  }

  // Convertir el modelo a JSON para enviar al API
  Map<String, dynamic> toJson() {
    return {
      'correo': correo,
      'contrasena': contrasena,
    };
  }
}

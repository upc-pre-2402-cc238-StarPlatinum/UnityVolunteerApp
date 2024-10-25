class ActivityModel {
  final String nombre;
  final String descripcion;
  final String tipoActividad;
  final int duracionDias;
  final String imagenUrl;

  ActivityModel({
    required this.nombre,
    required this.descripcion,
    required this.tipoActividad,
    required this.duracionDias,
    required this.imagenUrl,
  });

  // Convertir de JSON a modelo de datos
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      tipoActividad: json['tipoActividad'],
      duracionDias: json['duracionDias'],
      imagenUrl: json['imagenUrl'],
    );
  }

  // Convertir el modelo a JSON para enviar al API o almacenar
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'tipoActividad': tipoActividad,
      'duracionDias': duracionDias,
      'imagenUrl': imagenUrl,
    };
  }
}

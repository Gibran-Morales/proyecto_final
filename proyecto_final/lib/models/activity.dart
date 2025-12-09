class Activity {
  final int id;
  final String materia;
  final String titulo;
  final String fechaEntrega;
  final String descripcion;
  final String estado;

  Activity({
    required this.id,
    required this.materia,
    required this.titulo,  
    required this.fechaEntrega,
    required this.descripcion,
    required this.estado,


  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'] as int,
      materia: json['materia'] as String,
      titulo: json['titulo'] as String,
      fechaEntrega: json['fechaEntrega'] as String,
      descripcion: json['descripcion'] as String,
      estado: json['estado'] as String,

    );
  }

  Map<String, dynamic> toJson() => { 
      'id': id,
      'materia': materia,
      'titulo': titulo,
      'fechaEntrega': fechaEntrega,
      'descripcion': descripcion,
      'estado': estado,

};
}
class Usuario {
  final String id;
  final String nombre;
  final String email;
  final String avatar;

  Usuario({
    required this.id,
    required this.nombre,
    required this.email,
    required this.avatar,
  });

  // Método para crear un Usuario a partir de un documento de Firestore
  factory Usuario.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Usuario(
      id: documentId,
      nombre: data['nombre'] ?? '',
      email: data['email'] ?? '',
      avatar: data['avatar'] ?? '',
    );
  }

  // Método para convertir un Usuario en un mapa para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'nombre': nombre,
      'email': email,
      'avatar': avatar,
    };
  }
}

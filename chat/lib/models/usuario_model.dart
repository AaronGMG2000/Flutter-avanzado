class UsuarioModel {
  bool online;
  String email;
  String nombre;
  String uid;

  UsuarioModel({
    this.online = false,
    this.email = 'Usuario@usuario.com',
    this.nombre = 'Usuario',
    this.uid = '1',
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        online: json["online"],
        email: json["email"],
        nombre: json["nombre"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "email": email,
        "nombre": nombre,
        "uid": uid,
      };
}

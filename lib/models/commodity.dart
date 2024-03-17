//classe para transferencia de dados entre camada de visao, regra de negocio e entidades
//DTO - data transfer object
class Commodity{
  String? id;
  String? name;
  String? type;

  Commodity({this.id, this.name, this.type});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }
}
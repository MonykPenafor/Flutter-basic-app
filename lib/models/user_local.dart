// classe a ser utilizada para transferencia de dados do usuario

class UserLocal{
// definir variaveis de instacia para representar os dados do usuario

  String? id;
  String? userName;
  String? email;
  String? password;
  // DateTime? birthday;
  String? phone;
  // String? image;
  
  UserLocal({
    this.id, 
    this.userName, 
    this.email, 
    this.password, 
    // this.birthday,
    this.phone,
    // this.image, 
  });


  // metodo para converter dados do objeto em formato compativel com json (firebase)
  Map<String, dynamic> toJson(){  //dynamic pq não alguns dados são string, outros int...
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "password": password,
      // "birthday": birthday,
      "phone": phone,
      // "image": image,
    };
  }
}
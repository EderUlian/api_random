import 'dart:convert';

import 'package:apirandomuser/model/Usuario.dart';

import 'package:http/http.dart' as http;

class UsuarioService{
  //
  // Retornar uma lista de Usuários da API
  //
  Future< List<Usuario> > getUsuarios() async{
    //Lista Dinâmica
    List<Usuario> usuarios = new List<Usuario>();

    try{
      //Chamada do recurso da API
      final resposta = await http.get("https://randomuser.me/api/?exc=gender,login,location,dob,registered,phone,id,nat&noinfo&results=10");
      //print(resposta.body);

      //Parser da resposta da API em um Lista Dinâmica
      List<dynamic> lista = json.decode(resposta.body)["results"];
      lista.forEach((e) {
        usuarios.add(Usuario.fromJson(e));
      });

    }catch(erro){
      throw Exception("ERRO: Não foi possível retornar os dados.");
    }
    return usuarios;

  }
}
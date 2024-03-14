import 'package:lista_tarefas_file_aula/models/tarefa.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Repositorio{
  Repositorio();

  Future<File> _pegarArquivo() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/listaTarefas.json");
  }

  void salvarLista(List<Tarefa> tarefas) async{
    File arquivo = await _pegarArquivo();
    String conteudoGravar = json.encode(tarefas);
    arquivo.writeAsString(conteudoGravar);
  }

  Future<List<dynamic>> recuperarLista() async{
    try{
      File arquivo = await _pegarArquivo();
      List<dynamic> tarefas = [];
      String temp = await arquivo.readAsString();
      tarefas = json.decode(temp);
      return tarefas;
        }
    catch(e){
      print(e);
      return [];
    }

  }

}
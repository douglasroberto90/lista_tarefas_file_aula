import 'package:flutter/material.dart';
import 'package:lista_tarefas_file_aula/my_app.dart';

import 'package:lista_tarefas_file_aula/repositories/repositorio.dart';

void main() {


  runApp(const MyApp());
  Repositorio rep = Repositorio();
  rep.recuperarLista();
}





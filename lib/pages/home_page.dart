import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_tarefas_file_aula/model/tarefa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controlerTarefa = TextEditingController();

  List<Tarefa> tarefas = [];

  void _adicionarTarefa() {
    Tarefa tarefa = Tarefa(titulo:controlerTarefa.text, realizado: false );
    tarefas.add(tarefa);
    for (var task in tarefas){
      print(task.titulo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          "Lista de tarefas",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 10.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(labelText: "Nova tarefa"),
                  controller: controlerTarefa,
                )),
                ElevatedButton(onPressed: _adicionarTarefa, child: Text("ADD"))
              ],
            ),
          ),
          Expanded(child: ListView.builder(itemBuilder: contruirListView))
        ],
      ),
    );
  }

  Widget contruirListView(BuildContext context, int index) {
    return Placeholder();
  }
}

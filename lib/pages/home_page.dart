import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_tarefas_file_aula/models/tarefa.dart';
import 'package:lista_tarefas_file_aula/repositories/repositorio.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controlerTarefa = TextEditingController();

  Repositorio _repositorio=Repositorio();
  List<Tarefa> tarefas = [];

  void _adicionarTarefa() {
    setState(() {
      Tarefa tarefa = Tarefa(titulo: controlerTarefa.text, realizado: false);
      tarefas.add(tarefa);
      controlerTarefa.text='';
      _repositorio.salvarLista(tarefas);
    });
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
          Expanded(child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: contruirListView))
        ],
      ),
    );
  }

  Widget contruirListView(BuildContext context, int index) {
    return Dismissible(
        key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
            title: Text(tarefas[index].titulo),
            value: tarefas[index].realizado,
            onChanged: (checked) {
              tarefas[index].realizado = checked!;
            },
            ),
    onDismissed: (direction){
      tarefas.removeAt(index);
    },
    );
  }
}

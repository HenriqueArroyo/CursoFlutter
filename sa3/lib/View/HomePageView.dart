import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'dart:convert'; 

class PaginaHome extends StatefulWidget { 
  final String email;

  PaginaHome({required this.email}); 

  @override
  State<PaginaHome> createState() => _PaginaHomeState(); 
}

class _PaginaHomeState extends State<PaginaHome> { 
  late SharedPreferences _prefs; 
  Map<String, List<String>> _tarefasPorEmail = {}; // para armazenar tarefas por email
  String get email => widget.email; 

  @override
  void initState() { 
    super.initState();
    _loadPreferences(); 
  }

  Future<void> _loadPreferences() async { 
    _prefs = await SharedPreferences.getInstance(); 
    setState(() { 
      _tarefasPorEmail = _getTarefasFromPrefs() ?? {}; 
    });
  }

  Map<String, List<String>>? _getTarefasFromPrefs() { // para obter as tarefas de acordo com o email das preferências compartilhadas
    String? tarefasString = _prefs.getString('${email}_tarefas'); 
    if (tarefasString != null) {
      Map<String, dynamic> tarefasMap = json.decode(tarefasString);
      return tarefasMap.map((key, value) {
        return MapEntry(key, List<String>.from(value));
      });
    }
    return null;
  }

  Future<void> _saveTarefasToPrefs() async { 
    String tarefasString = json.encode(_tarefasPorEmail); 
    await _prefs.setString('${email}_tarefas', tarefasString); 
  }

  void _adicionarTarefa(String nomeTarefa) { 
    showDialog( 
      context: context, 
      builder: (BuildContext context) { 
        return AlertDialog( 
          title: Text('Nova Tarefa'), 
          content: TextField(
            onChanged: (value) { 
              nomeTarefa = value; 
            },
            decoration: InputDecoration( 
              hintText: 'Digite o nome da tarefa',
            ),
          ),
          actions: <Widget>[ 
            TextButton( 
              onPressed: () { 
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'), 
            ),
            TextButton( 
              onPressed: () {
                setState(() {
                  _tarefasPorEmail.update(email, (value) => [...value, nomeTarefa], 
                      ifAbsent: () => [nomeTarefa]); 
                });
                _saveTarefasToPrefs(); 
                Navigator.of(context).pop(); 
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _deletarTarefa(String tarefa) { 
    showDialog( 
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog( 
          title: Text('Confirmar exclusão'), 
          content: Text('Tem certeza que deseja excluir esta tarefa?'), 
          actions: <Widget>[ 
            TextButton( 
              onPressed: () {
                setState(() {
                  _tarefasPorEmail[email]!.remove(tarefa); 
                });
                _saveTarefasToPrefs(); 
                Navigator.of(context).pop(); 
              },
              child: Text('Sim'), 
            ),
            TextButton( 
              onPressed: () { 
                Navigator.of(context).pop(); 
              },
              child: Text('Cancelar'), 
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Lista de Tarefas'), 
      ),
      body: Column( 
        children: [ 
          Expanded( 
            child: ListView.builder( 
              itemCount: _tarefasPorEmail[email]?.length ?? 0, 
              itemBuilder: (context, index) { 
                final tarefa = _tarefasPorEmail[email]![index]; 
                return ListTile( 
                  title: Text(tarefa), 
                  trailing: IconButton( 
                    icon: Icon(Icons.delete), 
                    onPressed: () { 
                      _deletarTarefa(tarefa); 
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( // Botão de ação flutuante para adicionar tarefa
        onPressed: () {
          _adicionarTarefa(''); // Chama o método para adicionar tarefa
        },
        tooltip: 'Adicionar Tarefa', // Texto que aparece quando o botão é mantido pressionado
        child: Icon(Icons.add), // Ícone do botão
      ),
    );
  }
}

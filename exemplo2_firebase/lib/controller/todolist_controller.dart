class TodolistController {
  List<Todolist> list = [];
  List<Todolist> get list => list ;


  Future<void> add(Todolist todo) {
    list.add(todo);
  }

  Future<void> delete(Todolist todo) {
    list.remove(todo);
  }


}
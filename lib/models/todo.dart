import 'package:flutter/cupertino.dart';

class TodoModel {
  late String _id;
  late String _title;
  late String _description;
  late String _date;
  late String _priority;
  late bool _checked;

  TodoModel(
      this._id, this._title, this._description, this._date, this._priority,
      [this._checked = false]);

  TodoModel.map(dynamic obj) {
    this._title = obj['title'];
    this._description = obj['description'];
    this._date = obj['date'];
    this._priority = obj['priority'];
  }
  String get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  String get priority => _priority;
  bool get checked => _checked;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['checked'] = _checked;
    map['priority'] = _priority;

    return map;
  }

  TodoModel.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
    this._checked = map['checked'];
    this._priority = map['priority'];
  }
}

class TodosProvider with ChangeNotifier {
  List<TodoModel> _items = [];

  List<TodoModel> get items {
    return [..._items];
  }

  TodoModel findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addTodo(TodoModel todo) {
    _items.add(todo);
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    _items.removeWhere((element) => element.id == todo.id);
    _items.add(todo);
    notifyListeners();
  }

  void deleteTodo(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter todo'),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const FlutterLogo(size: 100),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('3/10'),
                            Text('tasks completed'),
                            Text('add a linear progress indicator here'),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 5,
              child: ListView.builder(
                  itemCount: Provider.of<TodosProvider>(context).items.length,
                  itemBuilder: (context, index) => CheckboxListTile(
                      value: false,
                      title: Text(Provider.of<TodosProvider>(context)
                          .items[index]
                          .title),
                      subtitle: Text(Provider.of<TodosProvider>(context)
                          .items[index]
                          .description),
                      onChanged: (value) {})),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // this._id = map['id'];
            // this._title = map['title'];
            // this._description = map['description'];
            // this._date = map['date'];
            // this._priority = map['priority'];

            addTodoDialog(context);
          },
          child: Icon(Icons.add),
        ));
  }

  Future<dynamic> addTodoDialog(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    String _priority = 'Low';
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<TodosProvider>(context, listen: false)
                          .addTodo(TodoModel(
                              "id",
                              _titleController.text,
                              _descriptionController.text,
                              DateTime.now().toIso8601String(),
                              _priority,
                              false));
                      Navigator.of(ctx).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add"),
                    ))
              ],
              content: Container(
                height: 320,
                child: Column(
                  children: [
                    Text("Add Todo", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _titleController,
                      decoration:
                          InputDecoration(labelText: 'Title', filled: true),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                          labelText: 'Description', filled: true),
                      maxLines: 4,
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                        value: "High",
                        onChanged: (value) {
                          _priority = value.toString();
                        },
                        decoration: InputDecoration(
                            labelText: 'Priority', filled: true),
                        items: [
                          DropdownMenuItem(
                            child: Text('High'),
                            value: 'High',
                          ),
                          DropdownMenuItem(
                            child: Text('Medium'),
                            value: 'Medium',
                          ),
                          DropdownMenuItem(
                            child: Text('Low'),
                            value: 'Low',
                          ),
                        ])
                  ],
                ),
              ),
            ));
  }
}

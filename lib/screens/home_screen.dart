import 'package:flutter/material.dart';

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
                itemBuilder: (context, index) => CheckboxListTile(
                    value: false,
                    activeColor: Colors.blue,
                    title: Text("Learn CSS Grid"),
                    subtitle: Text("Freecodecamp"),
                    tristate: true,
                    isThreeLine: true,
                    onChanged: (value) {}),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ));
  }
}

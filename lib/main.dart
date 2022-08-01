import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List todoTitle = [];
List todoNote = [];

final title = TextEditingController();
final note = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  int currentIndex = 0;

  addItem() {
    setState(() {
      todoTitle.add(title.text);
      todoNote.add(note.text);
    });
    title.clear();
    note.clear();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[];

    final List<Color> colorCodes = <Color>[
      Colors.blue.shade100,
      Colors.indigo.shade100,
      Colors.yellow.shade100,
      Colors.orange.shade100,
      Colors.red.shade100,
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do List"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                controller: title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: note,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Note',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todoTitle.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: colorCodes[index],
                      child: ListTile(
                        title: Text(todoTitle[index]),
                        subtitle: Text(todoNote[index], maxLines: 3),
                      ),
                    );
                  }),
            )
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: addItem,
          child: Icon(Icons.add),
          tooltip: 'Press here to add',
        ));

  }
}
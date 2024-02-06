import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> myTiles = [
  'opcao 1',
  'opcao 2',
  'opcao 3',
  'opcao 4',
  'opcao 5',
];

class _HomePageState extends State<HomePage> {
  void updateTiles(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final tile = myTiles.removeAt(oldIndex);
      myTiles.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            updateTiles(oldIndex, newIndex);
          },
          children: [
            for (final tile in myTiles)
              ListTile(
                key: ValueKey(tile),
                leading: const Icon(Icons.drag_handle), // <-- Icon for dragging
                title: Text(tile),
              )
          ],
        ),
      ),
    );
  }
}

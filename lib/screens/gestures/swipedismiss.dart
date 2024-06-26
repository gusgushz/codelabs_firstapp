import 'package:flutter/material.dart';

// Dismiss is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class Dismiss extends StatefulWidget {
  const Dismiss({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<Dismiss> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                items.removeAt(index);
              });
    
              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Theme.of(context).colorScheme.outline),
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}
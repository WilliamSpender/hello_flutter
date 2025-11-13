// dart
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  final TextEditingController _noteController = TextEditingController();
  final List<String> _notes = [];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildSandwichContainer(
              _quantity,
              'Footlong',
                _notes.join('\n')
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                // TextField grows vertically as the user types new lines
                child: TextField(
                  controller: _noteController,
                  maxLines: 1,
                  onSubmitted: (note) {
                    final text = note.trim();
                    if (text.isEmpty) return;
                    setState(() {
                      _notes.add('- $text');
                      _noteController.clear();
                    });
                  },
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: 'Notes:',
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _addSandwich,
                  child: const Text('Add'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _removeSandwich,
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addSandwich() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _removeSandwich() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }

  Container buildSandwichContainer(int quantity, String itemType, String note) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      // No fixed height so the container grows with the text
      child: OrderItemDisplay(quantity, itemType, note: note),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;
  final String note;

  const OrderItemDisplay(this.quantity, this.itemType,
      {this.note = '', super.key});

  String get suffix => quantity == 1 ? '' : 'es';

  @override
  Widget build(BuildContext context) {
    final noteLine = note.trim().isEmpty ? '' : '\n $note';
    return Text(
      '$quantity $itemType sandwich$suffix:${noteLine.isEmpty ? '' : noteLine}\n${'🥪' * quantity}',
      style: const TextStyle(fontSize: 16),
    );
  }
}
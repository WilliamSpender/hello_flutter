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
  SandwichSize _selectedSize = SandwichSize.footlong;
  BreadType _selectedBread = BreadType.white;

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
                  onPressed: (_quantity < widget.maxQuantity) ? _addSandwich : null,
                  style: _genericButtonStyle(Colors.greenAccent),
                  child: const Text('Add'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: (_quantity > 0) ? _removeSandwich : null,
                  style: _genericButtonStyle(Colors.red),
                  child: const Text('Remove'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: ElevatedButton(
                  onPressed: _cycleSize,
                  style: _genericButtonStyle(Colors.greenAccent),
                  child: Text(_getNextSize().label),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  ButtonStyle _genericButtonStyle(Color backgroundColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      disabledBackgroundColor: Colors.grey,
      foregroundColor: Colors.white,
    );
  }

  void _addSandwich() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _cycleSize() {
    setState(() {
      _selectedSize = _getNextSize();
    });
  }

  SandwichSize _getNextSize() {
    return SandwichSize.values[
    (_selectedSize.index + 1) % SandwichSize.values.length];
  }

  void _cycleBread() {
    setState(() {
      _selectedBread = BreadType.values[
          (_selectedBread.index + 1) % BreadType.values.length];
    });
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
    final noteLine = note.trim().isEmpty ? '' : '\n$note';
    return Text(
      '$quantity $itemType sandwich$suffix:${noteLine.isEmpty ? '' : noteLine}\n${'🥪' * quantity}',
      style: const TextStyle(fontSize: 16),
    );
  }
}

enum SandwichSize {
  footlong('Footlong'),
  sixInch('Six-inch');

  final String label;
  const SandwichSize(this.label);

  @override
  String toString() => label;
}

enum BreadType {
  white('White'),
  wheat('Wheat'),
  multigrain('Multigrain'),
  sourdough('Sourdough'),
  rye('Rye'),
  glutenFree('Gluten-free');

  final String label;
  const BreadType(this.label);
}

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
      home: OrderScreen(maxQuantity: 5)
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _addSandwich(),
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => _removeSandwich(),
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
    setState(() {
      if (_quantity < widget.maxQuantity) {
        setState(() => _quantity++);
      }
    });
  }

  void _removeSandwich() {
    setState(() {
      if (_quantity > 0) {
        setState(() => _quantity--);
      }
    });
  }

  Container buildSandwichContainer(int quantity, String itemType) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 50,
      child: OrderItemDisplay(quantity, itemType),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  String get suffix => quantity == 1 ? '' : 'es';

  @override
  Widget build(BuildContext context) {
    return Text('''$quantity $itemType sandwich$suffix:
    ${'🥪' * quantity}''');
  }
}


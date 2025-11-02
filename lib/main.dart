import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 50,
                child: const OrderItemDisplay(5, 'Footlong'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 50,
                child: const OrderItemDisplay(3, 'BLT Sandwich'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 50,
                child: const OrderItemDisplay(7, 'CLUB Sandwich'),
              ),
            ],

        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('''$quantity $itemType sandwich(es):
    ${'🥪' * quantity}''');
  }
}

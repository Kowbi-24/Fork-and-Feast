import 'package:flutter/material.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';
//import 'package:food_order_system/util/back_arrow_icon.dart';


class Transactions extends StatefulWidget {
  List<Transaction> transactions;

  Transactions({super.key, required this.transactions});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  void clearAll() async {
    await transactionBox.clear();
    setState(()  {
      widget.transactions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackArrowIcon(
            backgroundColor: Color.fromARGB(255, 5, 59, 80),
            iconColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        title: const Text(
          'TRANSACTIONS',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: widget.transactions.isEmpty
          ? const Center(child: Text('Transactions you make will show up here'))
          : Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            clearAll();
                          },
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0
                          ),
                          child: Text("Clear all")),
                    ),
                  ],
                ),
              Expanded(
                child: ListView.builder(
                        itemCount: widget.transactions.length,
                        itemBuilder: (context, index) {
                final transaction = widget.transactions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TransactionCard(
                    items: transaction.listFood,
                    total: transaction.totalPrice,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionDetail(
                            items: transaction.listFood,
                            total: transaction.totalPrice,
                          ),
                        ),
                      );
                    },
                  ),
                );
                        },
                      ),
              ),
            ],
          ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final Map<Food, int> items;
  final double total;
  final VoidCallback onTap;

  const TransactionCard({
    Key? key,
    required this.items,
    required this.total,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListTile(
            onTap: onTap,
            title: Text(
              'Transaction - ${items.length} items',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.entries.map((entry) {
                final food = entry.key;
                final quantity = entry.value;
                return Text('${food.name} x$quantity');
              }).toList(),
            ),
            trailing: Text(
              '\₱${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}


class TransactionDetail extends StatelessWidget {
  final Map<Food, int> items;
  final double total;

  const TransactionDetail({
    Key? key,
    required this.items,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ordered Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items.keys.elementAt(index);
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Quantity: ${items.values.elementAt(index)}'),
                    trailing: Text('\₱${(item.price * items.values.elementAt(index)).toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              'Total: \₱${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

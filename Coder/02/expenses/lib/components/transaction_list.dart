import 'package:expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  const TransactionList({super.key, required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactionList.map((t) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Container(
                  constraints: BoxConstraints(minWidth: 110),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    'R\$ ${t.value.toStringAsFixed(2)}',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      t.title,
                    ),
                    Text(
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      DateFormat('d MMM y').format(t.date),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

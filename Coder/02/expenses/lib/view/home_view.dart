import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/model/transaction.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Conta de água',
      value: 205.20,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de energia',
      value: 320.80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de água',
      value: 205.20,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de energia',
      value: 320.80,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Despesas'),
        actionsPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Card(
                elevation: 2,
                color: Theme.of(context).primaryColor,
                child: Text(textAlign: TextAlign.center, 'Gráfico'),
              ),
            ),
            Column(children: [TransactionList(transactionList: _transactions)]),
          ],
        ),
      ),
    );
  }
}

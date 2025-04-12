import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key, required this.onSubmit});
  final void Function(String, double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControllerText = TextEditingController();
  final valueControllerText = TextEditingController();

  void _onSubmit() {
    final title = titleControllerText.text;
    final value =
        double.tryParse(valueControllerText.text) ??
        double.tryParse(valueControllerText.text.replaceAll(',', '.')) ??
        0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(titleControllerText.text, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 3,
          children: [
            TextField(
              autofocus: true,
              controller: titleControllerText,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                label: Text('Título'),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            TextField(
              controller: valueControllerText,
              cursorColor: Colors.black,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                label: Text('Valor'),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _onSubmit,
              icon: Icon(Icons.add_box),
              label: Text(style: TextStyle(color: Colors.black), 'Adicionar'),
              style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.black),
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

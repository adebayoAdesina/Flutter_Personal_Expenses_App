import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/Util/color.dart';

class TransactionCard extends StatelessWidget {
  final String text;
  final String price;
  final DateTime date;
  const TransactionCard(
      {Key? key, required this.text, required this.price, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
          ),
          child: Text(
            price,
            style: const TextStyle(
              color: kPrimaryColor,
            ),
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        subtitle: Text(
          DateFormat('yyyy/mm/dd, h:m:s').format(date),
        ),
      ),
    );
  }
}

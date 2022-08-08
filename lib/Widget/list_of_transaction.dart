import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/appdata.dart';
import 'transaction_card.dart';

class ListOfTransaction extends StatelessWidget {
  const ListOfTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: context.watch<AppData>().transaction.length,
      itemBuilder: ((context, index) {
        final e = context.watch<AppData>().transaction[index];
        return TransactionCard(
          text: e.title!,
          price: e.amount!.toStringAsFixed(2),
          date: e.date!,
        );
      }),
    );
  }
}

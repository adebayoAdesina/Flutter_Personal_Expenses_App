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
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: context
              .watch<AppData>()
              .transaction
              .map(
                (e) => TransactionCard(
                  text: e.title!,
                  price: e.amount!.toStringAsFixed(2),
                  date: e.date!,
                ),
              )
              .toList(),
        ),);
  }
}
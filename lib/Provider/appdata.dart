import 'dart:collection';

import 'package:flutter/material.dart';

import '../Model/transaction_model.dart';

class AppData extends ChangeNotifier {
  final List<Transaction> _transaction = [];

  void upDateTransaction(String title, double amount) {
    _transaction.add(
      Transaction(
        id: _transaction.length,
        title: title,
        amount: amount,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  UnmodifiableListView<Transaction> get transaction =>
      UnmodifiableListView(_transaction);
}

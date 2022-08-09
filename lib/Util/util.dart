import 'package:flutter/material.dart';

showSnapBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

alertDialog(BuildContext context, contexts, transaction) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Are you sure you to delete?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'No',
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        contexts.deleteTransaction(transaction);
                        Navigator.pop(context);
                      },
                      child: const Text('Yes'))
                ],
              )
            ],
          ));
}

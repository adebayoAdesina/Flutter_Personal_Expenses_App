import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/Provider/appdata.dart';
import 'package:personal_expenses/Util/color.dart';
import 'package:personal_expenses/Widget/chart.dart';
import 'package:provider/provider.dart';

import '../Widget/list_of_transaction.dart';

enum UserInput { title, amount }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? title;
  double? amount;

  UserInput? user;

  void addExpens(contexts, String val) {
    contexts.upDateTransaction(
      title!,
      amount!,
      pickedDate!,
    );
    Navigator.pop(context);
    setState(() {
      title = null;
      amount = null;
      pickedDate = null;
    });
  }

  DateTime? pickedDate;
  void getDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          pickedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AppData()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Chart(
                  recentTransactions:
                      context.watch<AppData>().recentTransactions),
              context.watch<AppData>().transaction.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage(
                                  'assets/image/ic-congratulations.png'),
                            ),
                            Text(
                              'NO EXPENSES ADD',
                              style: Theme.of(context).textTheme.titleLarge,
                            )
                          ],
                        ),
                      ),
                    )
                  : const ListOfTransaction()
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottom(context, context.read<AppData>());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<dynamic> showModalBottom(BuildContext context, contexts) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          color: kModalBgColor,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                const Text(
                  'Input New Expenses',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kPrimaryColor),
                ),
                const Divider(),
                TextField(
                  autofocus: true,
                  onChanged: ((value) => setState(() {
                        title = value;
                      })),
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) => addExpens(contexts, ''),
                  onChanged: ((value) => setState(
                        () {
                          amount = double.parse(value);
                        },
                      )),
                  decoration: const InputDecoration(labelText: 'Amount'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(pickedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(pickedDate!)}'),
                    TextButton(
                        onPressed: () => getDate(),
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                OutlinedButton(
                  onPressed: () => addExpens(contexts, ''),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Text(
                      'Add',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

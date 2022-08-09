import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spentTotal;
  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendAmount,
      required this.spentTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
            child: FittedBox(
              child: Text(
                spendAmount.toStringAsFixed(0),
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          SizedBox(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                      220,
                      220,
                      220,
                      1,
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spentTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(label)
        ],
      ),
    );
  }
}

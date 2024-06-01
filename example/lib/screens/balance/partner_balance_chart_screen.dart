import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wapas/models/balance_model.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas_example/globals.dart';
import 'package:wapas_example/screens/reports/chart.dart';
import 'package:wapas_example/widgets/balance_chart.dart';

class PartnerBalanceChartScreen extends StatefulWidget {
  const PartnerBalanceChartScreen({super.key});

  @override
  State<PartnerBalanceChartScreen> createState() =>
      _PartnerBalanceChartScreenState();
}

class _PartnerBalanceChartScreenState extends State<PartnerBalanceChartScreen> {
  final GlobalKey<BalanceChartState> _childKey = GlobalKey<BalanceChartState>();

  String selectedAmountType = "Amount";
  TextEditingController userIdController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController transactionTypesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // userIdController.text = "660a7bf84dbc9d6090cd6226";
    // currencyController.text = "INR";
    // transactionTypesController.text = "AMOUNT,Income,TRANSFER";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partner Balance Chart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              userIdController.text.isNotEmpty &&
                      currencyController.text.isNotEmpty
                  ? BalanceChart(
                      key: _childKey,
                      userId: userIdController.text,
                      currency: currencyController.text,
                      amountType: selectedAmountType.toLowerCase(),
                      transactionTypes:
                          transactionTypesController.text.isNotEmpty
                              ? transactionTypesController.text.split(",")
                              : null,
                    )
                  : Text('fill details below'),
              TextField(
                controller: userIdController,
                decoration: InputDecoration(labelText: 'User ID'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: currencyController,
                decoration: InputDecoration(labelText: 'Currency'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: transactionTypesController,
                decoration: InputDecoration(labelText: 'Transaction Types'),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedAmountType,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(labelText: "Amount type"),
                items: globals.simpleAmountTypes.values.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.toString()),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedAmountType = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {

                  });
                  _childKey.currentState?.refresh();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

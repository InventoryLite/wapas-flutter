import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas_example/globals.dart';
import 'package:wapas_example/screens/reports/chart.dart';

class PartnerReportChartScreen extends StatefulWidget {
  const PartnerReportChartScreen({super.key});

  @override
  State<PartnerReportChartScreen> createState() =>
      _PartnerReportChartScreenState();
}

class _PartnerReportChartScreenState extends State<PartnerReportChartScreen> {
  final _wapasPlugin = Wapas();
  String selectedAmountType = "Amounts";
  String selectedType = "Amount";
  String selectedVolume = "grouped";
  List<TransactionModel> transactions = [];

  bool includePrevious = false, includeToday = true;

  TextEditingController userIdController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController transactionTypeController = TextEditingController();
  List<ChartData> chartData = [];

  void fetch() async {
    if (userIdController.text.isNotEmpty &&
        currencyController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        groupController.text.isNotEmpty &&
        transactionTypeController.text.isNotEmpty) {
      transactions = await _wapasPlugin.getBalanceReport(
        userIdController.text,
        currencyController.text,
        startDateController.text,
        endDateController.text,
        groupController.text,
        includePrevious,
        includeToday,
      );

      String key = (selectedVolume + selectedType + selectedAmountType)
          .replaceFirst("AmountAmounts", "Amounts");

      for (int i = 0; i < transactions!.length; i++) {
        List<String> transactionTypes =
            transactions[i].toJson()[key]!.keys.toList();
        if (transactionTypes.contains(transactionTypeController.text)) {
          chartData.add(
            ChartData(
              transactions[i]!.date.toString(),
              double.parse(
                transactions[i]
                    .toJson()[key]![transactionTypeController.text]
                    .toString(),
              ),
            ),
          );
        }
      }

      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(globals.blankFieldError)));
    }
  }

  @override
  void initState() {
    super.initState();
    userIdController.text = "660a7bf84dbc9d6090cd6226";
    currencyController.text = "INR";
    startDateController.text = "2024-04-01";
    endDateController.text = "2024-04-30";
    groupController.text = "daily";
    transactionTypeController.text = "AMOUNT";
    fetch();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (isStartDate) {
        setState(() {
          startDateController.text = picked.toString().split(" ")[0];
        });
      } else {
        setState(() {
          endDateController.text = picked.toString().split(" ")[0];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partner Report Chart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SfCartesianChart(
                series: <CartesianSeries>[
                  // Renders column chart
                  ColumnSeries(
                      dataSource: chartData,
                      xValueMapper: (data, _) => data.x,
                      yValueMapper: (data, _) => data.y)
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
              ),
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
                onTap: () {
                  _selectDate(context, true);
                },
                controller: startDateController,
                decoration: InputDecoration(labelText: 'Start Date'),
              ),
              SizedBox(height: 10),
              TextField(
                onTap: () {
                  _selectDate(context, false);
                },
                controller: endDateController,
                decoration: InputDecoration(labelText: 'End Date'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: groupController,
                decoration: InputDecoration(labelText: 'Group'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: transactionTypeController,
                decoration:
                    InputDecoration(labelText: 'Transaction Type (Report key)'),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedAmountType,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(labelText: "Amount type"),
                items: globals.amountTypes.values.map((String items) {
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
              DropdownButtonFormField(
                value: selectedType,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(labelText: "Type"),
                items: globals.types.values.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.toString()),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue!;
                  });
                },
              ),
              DropdownButtonFormField(
                value: selectedVolume,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(labelText: "Volume"),
                items: globals.volumes.values.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.toString()),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedVolume = newValue!;
                  });
                },
              ),
              Row(
                children: [
                  Text('Include Previous'),
                  Spacer(),
                  Checkbox(
                    value: includePrevious,
                    onChanged: (newVal) {
                      includePrevious = newVal!;
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Include Today'),
                  Spacer(),
                  Checkbox(
                    value: includeToday,
                    onChanged: (newVal) {
                      includeToday = newVal!;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: fetch,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

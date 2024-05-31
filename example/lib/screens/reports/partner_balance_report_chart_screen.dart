import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas_example/globals.dart';
import 'package:wapas_example/screens/reports/chart.dart';

class PartnerBalanceReportChartScreen extends StatefulWidget {
  const PartnerBalanceReportChartScreen({super.key});

  @override
  State<PartnerBalanceReportChartScreen> createState() =>
      _PartnerBalanceReportChartScreenState();
}

class _PartnerBalanceReportChartScreenState
    extends State<PartnerBalanceReportChartScreen> {
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
  TextEditingController transactionTypesController = TextEditingController();
  List<ChartData> chartData = [];

  void fetch() async {
    if (userIdController.text.isNotEmpty &&
        currencyController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        groupController.text.isNotEmpty &&
        transactionTypesController.text.isNotEmpty) {
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
      double totalValue = 0;
      List<String> types = transactionTypesController.text.split(",");
      for (int i = 0; i < types.length; i++) {
        totalValue += double.parse(
          transactions[0].toJson()[key]![types[i]].toString(),
        );
      }

      for (int i = 0; i < transactions[0].toJson()[key]!.length; i++) {
        String transactionType =
            transactions[0].toJson()[key]!.keys.toList()[i];
        if (types.contains(transactionType)) {
          double percentage =
              (transactions[0].toJson()[key]!.values.toList()[i] / totalValue) *
                  100;
          chartData.add(
            ChartData(
              transactionType,
              double.parse(percentage.toStringAsFixed(2)),
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
    groupController.text = "monthly";
    transactionTypesController.text = "AMOUNT,Income,TRANSFER";
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
        title: const Text('Partner Balance Report Chart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SfCircularChart(
                selectionGesture: ActivationMode.singleTap,
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<ChartData, String>(
                    dataSource: chartData,
                    // pointColorMapper:(ChartData data,  _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    enableTooltip: true,
                    dataLabelMapper: (data, _) => "${data.x} ${data.y} %",
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                      labelIntersectAction: LabelIntersectAction.shift,
                      useSeriesColor: true,
                      connectorLineSettings: ConnectorLineSettings(
                        length: '10%',
                        type: ConnectorType.line,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
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
                controller: transactionTypesController,
                decoration: InputDecoration(labelText: 'Transaction Types'),
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

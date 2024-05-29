import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/models/transaction_report_list_model.dart';
import 'package:wapas/models/transaction_report_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas_example/globals.dart';

class PartnerTransactionsTablesScreen extends StatefulWidget {
  const PartnerTransactionsTablesScreen({super.key});

  @override
  State<PartnerTransactionsTablesScreen> createState() => _PartnerTransactionsTablesScreenState();
}

class _PartnerTransactionsTablesScreenState extends State<PartnerTransactionsTablesScreen> {
  final _wapasPlugin = Wapas();
  String selectedAvailableChart = "Partner Balance Report Chart";
  List<TransactionReportModel> transactions = [];

  bool suspense = false;
  int limit = 10;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController limitController = TextEditingController();

  void fetch() async {
    //TODO: confirm why this not working
    TransactionReportListModel transactionListModel =
    await _wapasPlugin.getTransactionsReport(
      // startDateController.text,
      // endDateController.text,
      // suspense,
      null, null, null,
      int.parse(limitController.text ?? "10"),
      "filter%5BCurrency%5D=INR&filter%5BPartnerId%5D=660a7bf84dbc9d6090cd6226",
    );

    transactions = transactionListModel!.rows ?? [];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    startDateController.text = "2024-04-01";
    endDateController.text = "2024-04-30";
    limitController.text = limit.toString();
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
        title: const Text('Partner Report Tables'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
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
                controller: limitController,
                decoration: InputDecoration(labelText: 'Limit'),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Suspense'),
                  Spacer(),
                  Checkbox(
                    value: suspense,
                    onChanged: (newVal) {
                      suspense = newVal!;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: fetch,
                child: Text('Submit'),
              ),
              transactions.isNotEmpty
                  ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text('CreatedAt'),
                    ),
                    DataColumn(
                      label: Text('Amount'),
                    ),
                    DataColumn(
                      label: Text('Currency'),
                    ),
                    DataColumn(
                      label: Text('Is Credit'),
                    ),
                    DataColumn(
                      label: Text('Transaction Type'),
                    ),
                    DataColumn(
                      label: Text('Reference'),
                    ),
                  ],
                  rows: [
                    for (int i = 0; i < transactions!.length; i++)
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              transactions![i]!.createdAt.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              transactions![i]!.amount.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              transactions![i]!.currency.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              transactions![i]!.isCredit.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              transactions![i]!
                                  .transactionTypeDetail!
                                  .name
                                  .toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              transactions![i]!.reference!.toString(),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

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
  State<PartnerTransactionsTablesScreen> createState() =>
      _PartnerTransactionsTablesScreenState();
}

class _PartnerTransactionsTablesScreenState
    extends State<PartnerTransactionsTablesScreen> {
  final _wapasPlugin = Wapas();
  List<TransactionReportModel> transactions = [];
  TextEditingController userIdController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController limitController = TextEditingController();

  void fetch() async {
    if (userIdController.text.isNotEmpty &&
        currencyController.text.isNotEmpty &&
        limitController.text.isNotEmpty) {
      //TODO: confirm why this not working
      TransactionReportListModel transactionListModel =
          await _wapasPlugin.getTransactionsReport(
        null,
        null,
        null,
        int.parse(limitController.text ?? "10"),
        "filter%5BCurrency%5D=${currencyController.text}&filter%5BPartnerId%5D=${userIdController.text}",
      );

      transactions = transactionListModel!.rows ?? [];
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(globals.blankFieldError)));
    }
  }

  @override
  void initState() {
    super.initState();
    limitController.text = "10";
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
                controller: limitController,
                decoration: InputDecoration(labelText: 'Limit'),
              ),
              SizedBox(height: 10),
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

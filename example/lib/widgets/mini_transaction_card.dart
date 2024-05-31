import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas_example/utils/date_util.dart';

class MiniTransactionCard extends StatefulWidget {
  final String userId;
  final String currency;
  final String type;
  final String label;
  final String endDate;
  final String startDate;
  final String group;
  final bool includePrevious;
  final bool includeToday;
  final String transactionType;
  final String amountType;
  final bool showPrevious;
  final String previousTitle;
  final String questionMessage;
  final String volume;
  final bool isTransaction;

  MiniTransactionCard({
    Key? key,
    required this.userId,
    required this.currency,
    this.type = "amount",
    this.label = "amount",
    required this.endDate,
    required this.startDate,
    required this.group,
    this.includePrevious = false,
    this.includeToday = false,
    this.transactionType = "AMOUNT",
    this.amountType = "amount",
    this.showPrevious = false,
    this.previousTitle = "",
    this.questionMessage = "",
    this.volume = "grouped",
    this.isTransaction = false,
  }):super(key: key);

  @override
  MiniTransactionCardState createState() => MiniTransactionCardState();
}

class MiniTransactionCardState extends State<MiniTransactionCard> {
  double amount = 0;
  double preAmount = 0;
  int transaction = 0;
  int previousTransaction = 0;
  bool loading = false;
  final _wapasPlugin = Wapas();

  void refresh() {
    fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });

    List<TransactionModel> balances = await _wapasPlugin.getBalanceReport(
      widget.userId,
      widget.currency,
      widget.startDate,
      widget.endDate,
      widget.group,
      widget.includePrevious,
      widget.includeToday,
    );

    if (balances.length == 2) {
      balances.forEach((balance) {
        if (formatDate(balance.date) == formatDate(widget.endDate)) {
          setState(() {
            transaction = balance.toJson()[widget.volume == 'group'
                    ? 'groupedTransactions'
                    : 'totalTransactions']?[widget.transactionType] ??
                0;
            if (widget.type == "amount") {
              if (widget.amountType == "virtual") {
                amount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedVirtualValues'
                            : 'totalVirtualValues']?[widget.transactionType] ??
                        0)
                    .toDouble();
              } else {
                amount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedAmounts'
                            : 'totalAmounts']?[widget.transactionType] ??
                        0)
                    .toDouble();
              }
            } else if (widget.type == "credit") {
              if (widget.amountType == "virtual") {
                amount = (balance.toJson()[widget.volume == 'group'
                                ? 'groupedCrediVirtualValues'
                                : 'totalCrediVirtualValues']
                            ?[widget.transactionType] ??
                        0)
                    .toDouble();
              } else {
                amount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedCreditAmounts'
                            : 'totalCreditAmounts']?[widget.transactionType] ??
                        0)
                    .toDouble();
              }
            } else if (widget.type == "debit") {
              if (widget.amountType == "virtual") {
                amount = (balance.toJson()[widget.volume == 'group'
                                ? 'groupedDebitVirtualValues'
                                : 'totalDebitVirtualValues']
                            ?[widget.transactionType] ??
                        0)
                    .toDouble();
              } else {
                amount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedDebitAmounts'
                            : 'totalDebitAmounts']?[widget.transactionType] ??
                        0)
                    .toDouble();
              }
            }
          });
        } else {
          setState(() {
            previousTransaction = balance.toJson()[widget.volume == 'group'
                    ? 'groupedTransactions'
                    : 'totalTransactions']?[widget.transactionType] ??
                0;
            if (widget.type == "amount") {
              if (widget.amountType == "virtual") {
                preAmount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedVirtualValues'
                            : 'totalVirtualValues']?[widget.transactionType] ??
                        0)
                    .toDouble();
              } else {
                preAmount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedAmounts'
                            : 'totalAmounts']?[widget.transactionType] ??
                        0)
                    .toDouble();
              }
            } else if (widget.type == "credit") {
              if (widget.amountType == "virtual") {
                preAmount = (balance.toJson()[widget.volume == 'group'
                                ? 'groupedCrediVirtualValues'
                                : 'totalCrediVirtualValues']
                            ?[widget.transactionType] ??
                        0)
                    .toDouble();
              } else {
                preAmount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedCreditAmounts'
                            : 'totalCreditAmounts']?[widget.transactionType] ??
                        0)
                    .toDouble();
              }
            } else if (widget.type == "debit") {
              if (widget.amountType == "virtual") {
                preAmount = (balance.toJson()[widget.volume == 'group'
                                ? 'groupedDebitVirtualValues'
                                : 'totalDebitVirtualValues']
                            ?[widget.transactionType] ??
                        0)
                    .toDouble();
              } else {
                preAmount = (balance.toJson()[widget.volume == 'group'
                            ? 'groupedDebitAmounts'
                            : 'totalDebitAmounts']?[widget.transactionType] ??
                        0)
                    .toDouble();
              }
            }
          });
        }
      });
    } else if (balances.length == 1) {
      setState(() {
        transaction = 0;
        previousTransaction = balances[0].toJson()[widget.volume == 'group'
                ? 'groupedTransactions'
                : 'totalTransactions']?[widget.transactionType] ??
            0;
        amount = 0;
        if (widget.type == "amount") {
          if (widget.amountType == "virtual") {
            preAmount = (balances[0].toJson()[widget.volume == 'group'
                        ? 'groupedVirtualValues'
                        : 'totalVirtualValues']?[widget.transactionType] ??
                    0)
                .toDouble();
          } else {
            preAmount = (balances[0].toJson()[widget.volume == 'group'
                        ? 'groupedAmounts'
                        : 'totalAmounts']?[widget.transactionType] ??
                    0)
                .toDouble();
          }
        } else if (widget.type == "credit") {
          if (widget.amountType == "virtual") {
            preAmount = (balances[0].toJson()[widget.volume == 'group'
                        ? 'groupedCrediVirtualValues'
                        : 'totalCrediVirtualValues']?[widget.transactionType] ??
                    0)
                .toDouble();
          } else {
            preAmount = (balances[0].toJson()[widget.volume == 'group'
                        ? 'groupedCreditAmounts'
                        : 'totalCreditAmounts']?[widget.transactionType] ??
                    0)
                .toDouble();
          }
        } else if (widget.type == "debit") {
          if (widget.amountType == "virtual") {
            preAmount = (balances[0].toJson()[widget.volume == 'group'
                        ? 'groupedDebitVirtualValues'
                        : 'totalDebitVirtualValues']?[widget.transactionType] ??
                    0)
                .toDouble();
          } else {
            preAmount = (balances[0].toJson()[widget.volume == 'group'
                        ? 'groupedDebitAmounts'
                        : 'totalDebitAmounts']?[widget.transactionType] ??
                    0)
                .toDouble();
          }
        }
      });
    } else {
      setState(() {
        transaction = 0;
        previousTransaction = 0;
        amount = 0;
        preAmount = 0;
      });
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final amountPercentChange =
        ((amount - preAmount) / (preAmount == 0 ? 1 : preAmount)) * 100;
    final transactionPercentChange = ((transaction - previousTransaction) /
            (previousTransaction == 0 ? 1 : previousTransaction)) *
        100;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              widget.label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loading
                      ? "Loading..."
                      : widget.isTransaction
                          ? transaction.toString()
                          : NumberFormat.currency(locale: 'en_IN', symbol: '₹')
                              .format(amount),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                if (!loading)
                  Row(
                    children: [
                      Icon(
                        (widget.isTransaction
                                    ? transactionPercentChange
                                    : amountPercentChange) <
                                0
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        color: (widget.isTransaction
                                    ? transactionPercentChange
                                    : amountPercentChange) <
                                0
                            ? Colors.red
                            : Colors.green,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${(widget.isTransaction ? transactionPercentChange : amountPercentChange).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
              ],
            ),
            if (widget.showPrevious)
              Column(
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loading
                            ? "Loading..."
                            : widget.isTransaction
                                ? previousTransaction.toString()
                                : NumberFormat.currency(
                                        locale: 'en_IN', symbol: '₹')
                                    .format(preAmount),
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          Text(widget.previousTitle.isEmpty
                              ? widget.group
                              : widget.previousTitle),
                          SizedBox(width: 5),
                          Tooltip(
                            message: widget.questionMessage.isEmpty
                                ? widget.group
                                : widget.questionMessage,
                            child: Icon(Icons.help_outline, size: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// void main() => runApp(MaterialApp(home: Scaffold(body: MiniTransactionCard(
//   userId: 'user123',
//   currency: 'INR',
//   credentials: {},
//   startDate: DateTime.now().subtract(Duration(days: 30)),
//   endDate: DateTime.now(),
//   group: 'monthly',
//   includePrevious: true,
//   includeToday: true,
//   showPrevious: true,
//   isTransaction: false,
// ))));

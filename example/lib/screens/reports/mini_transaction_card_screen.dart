import 'package:flutter/material.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas_example/globals.dart';
import 'package:wapas_example/widgets/mini_transaction_card.dart';

class MiniTransactionCardScreen extends StatefulWidget {
  const MiniTransactionCardScreen({super.key});

  @override
  State<MiniTransactionCardScreen> createState() =>
      _MiniTransactionCardScreenState();
}

class _MiniTransactionCardScreenState extends State<MiniTransactionCardScreen> {
  final GlobalKey<MiniTransactionCardState> _childKey =
      GlobalKey<MiniTransactionCardState>();

  String selectedAmountType = "Amount";
  String selectedType = "Amount";
  String selectedVolume = "group";
  TransactionModel? transaction;

  bool includePrevious = false, includeToday = true;

  TextEditingController userIdController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController transactionTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userIdController.text = "660a7bf84dbc9d6090cd6226";
    currencyController.text = "INR";
    startDateController.text = "2024-04-01";
    endDateController.text = "2024-04-30";
    groupController.text = "monthly";
    transactionTypeController.text = "AMOUNT";
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
        title: const Text('Mini transaction card'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              userIdController.text.isNotEmpty &&
                      currencyController.text.isNotEmpty &&
                      startDateController.text.isNotEmpty &&
                      endDateController.text.isNotEmpty &&
                      groupController.text.isNotEmpty &&
                      transactionTypeController.text.isNotEmpty
                  ? MiniTransactionCard(
                      key: _childKey,
                      userId: userIdController.text,
                      currency: currencyController.text,
                      startDate: startDateController.text,
                      endDate: endDateController.text,
                      group: groupController.text,
                      includePrevious: includePrevious,
                      amountType: selectedAmountType.toLowerCase(),
                      transactionType: transactionTypeController.text,
                      type: selectedType.toLowerCase(),
                      volume: selectedVolume,
                      includeToday: includeToday,
                      showPrevious: true,
                      isTransaction: false,
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
                items: globals.simpleVolumes.values.map((String items) {
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
                onPressed: () {
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

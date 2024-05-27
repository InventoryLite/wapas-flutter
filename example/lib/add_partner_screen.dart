import 'package:flutter/material.dart';

import 'package:wapas/wapas.dart';

class AddPartnerScreen extends StatefulWidget {
  final Wapas wapasPlugin;

  AddPartnerScreen({super.key, required this.wapasPlugin});

  @override
  State<AddPartnerScreen> createState() => _AddPartnerScreenState();
}

class _AddPartnerScreenState extends State<AddPartnerScreen> {
  TextEditingController parentIdController = new TextEditingController();
  TextEditingController partnerIdController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    parentIdController.text = "662f7997704a55d1820cd8ee";
  }

  void doSavePartner() async {
    if (partnerIdController.text.isNotEmpty) {
      await widget.wapasPlugin.savePartner({
        "isActive": true,
        "parentId": parentIdController.text,
        "partnerId": partnerIdController.text,
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Partner saved!')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill both fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Partner'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: parentIdController,
              decoration: InputDecoration(hintText: 'Parent ID'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: partnerIdController,
              decoration: InputDecoration(hintText: 'Partner ID'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: doSavePartner,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wapas/models/validate_coupon_model.dart';

import 'package:wapas/wapas.dart';

class CouponValidityScreen extends StatefulWidget {
  final Wapas wapasPlugin;

  CouponValidityScreen({super.key, required this.wapasPlugin});

  @override
  State<CouponValidityScreen> createState() => _CouponValidityScreenState();
}

class _CouponValidityScreenState extends State<CouponValidityScreen> {
  TextEditingController couponCodeController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();
  TextEditingController partnerIdController = new TextEditingController();
  ValidateCouponModel? validateCouponModel;

  @override
  void initState() {
    super.initState();
  }

  void doCheckValidity() async {
    if (couponCodeController.text.isNotEmpty &&
        amountController.text.isNotEmpty) {
      validateCouponModel = await widget.wapasPlugin.validateCoupon(
          partnerIdController.text,
          amountController.text,
          couponCodeController.text);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill required fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validate Coupon'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: couponCodeController,
              decoration: InputDecoration(hintText: '*Coupon Code'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              decoration: InputDecoration(hintText: '*Amount'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: partnerIdController,
              decoration: InputDecoration(hintText: 'Partner ID'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: doCheckValidity,
              child: Text('Submit'),
            ),
            validateCouponModel != null
                ? Text(validateCouponModel!.toJson().toString())
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

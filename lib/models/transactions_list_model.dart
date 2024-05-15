import 'package:wapas/models/transaction_model.dart';

class TransactionListModel {
  List<TransactionModel>? rows;
  int? count;

  TransactionListModel({this.rows, this.count});

  TransactionListModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <TransactionModel>[];
      json['rows'].forEach((v) {
        rows!.add(new TransactionModel.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

import 'package:wapas/models/balance_history_model.dart';

class BalanceHistoryListModel {
  List<BalanceHistoryModel>? rows;

  BalanceHistoryListModel({this.rows});

  BalanceHistoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <BalanceHistoryModel>[];
      json['rows'].forEach((v) {
        rows!.add(new BalanceHistoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

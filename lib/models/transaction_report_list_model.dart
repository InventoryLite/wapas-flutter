import 'package:wapas/models/transaction_report_model.dart';

class TransactionReportListModel {
  int? count;
  int? limit;
  int? offset;
  List<TransactionReportModel>? rows;

  TransactionReportListModel({this.count, this.limit, this.offset, this.rows});

  TransactionReportListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['rows'] != null) {
      rows = <TransactionReportModel>[];
      json['rows'].forEach((v) {
        rows!.add(new TransactionReportModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

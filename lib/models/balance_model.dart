class BalanceModel {
  String? transactionType;
  String? currency;
  String? amount;
  String? virtualValue;
  String? totalVirtualValue;

  BalanceModel(
      {this.transactionType,
      this.currency,
      this.amount,
      this.virtualValue,
      this.totalVirtualValue});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    transactionType = json['transactionType'];
    currency = json['currency'];
    amount = json['amount'];
    virtualValue = json['virtualValue'];
    totalVirtualValue = json['totalVirtualValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionType'] = this.transactionType;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    data['virtualValue'] = this.virtualValue;
    data['totalVirtualValue'] = this.totalVirtualValue;
    return data;
  }
}

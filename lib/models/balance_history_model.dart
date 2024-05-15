class BalanceHistoryModel {
  String? date;
  String? identifier;
  String? tenantId;
  String? currency;
  Map<String, dynamic>? amounts;
  Map<String, dynamic>? totalAmounts;
  Map<String, dynamic>? virtualValues;
  Map<String, dynamic>? totalVirtualValues;
  Map<String, dynamic>? transactionsCount;
  Map<String, dynamic>? totalTransactionsCount;
  Map<String, dynamic>? creditAmounts;
  Map<String, dynamic>? totalCreditAmounts;
  Map<String, dynamic>? creditVirtualValues;
  Map<String, dynamic>? totalCreditVirtualValues;
  Map<String, dynamic>? debitAmounts;
  Map<String, dynamic>? totalDebitAmounts;
  Map<String, dynamic>? debitVirtualValues;
  Map<String, dynamic>? totalDebitVirtualValues;
  String? createdAt;
  String? updatedAt;

  BalanceHistoryModel({
    this.date,
    this.identifier,
    this.tenantId,
    this.currency,
    this.amounts,
    this.totalAmounts,
    this.virtualValues,
    this.totalVirtualValues,
    this.transactionsCount,
    this.totalTransactionsCount,
    this.creditAmounts,
    this.totalCreditAmounts,
    this.creditVirtualValues,
    this.totalCreditVirtualValues,
    this.debitAmounts,
    this.totalDebitAmounts,
    this.debitVirtualValues,
    this.totalDebitVirtualValues,
    this.createdAt,
    this.updatedAt,
  });

  factory BalanceHistoryModel.fromJson(Map<String, dynamic> json) {
    return BalanceHistoryModel(
      date: json['date'],
      identifier: json['identifier'],
      tenantId: json['tenantId'],
      currency: json['currency'],
      amounts: json['amounts'] ?? {},
      totalAmounts: json['totalAmounts'] ?? {},
      virtualValues: json['virtualValues'] ?? {},
      totalVirtualValues: json['totalVirtualValues'] ?? {},
      transactionsCount: json['transactionsCount'] ?? {},
      totalTransactionsCount: json['totalTransactionsCount'] ?? {},
      creditAmounts: json['creditAmounts'] ?? {},
      totalCreditAmounts: json['totalCreditAmounts'] ?? {},
      creditVirtualValues: json['creditVirtualValues'] ?? {},
      totalCreditVirtualValues: json['totalCreditVirtualValues'] ?? {},
      debitAmounts: json['debitAmounts'] ?? {},
      totalDebitAmounts: json['totalDebitAmounts'] ?? {},
      debitVirtualValues: json['debitVirtualValues'] ?? {},
      totalDebitVirtualValues: json['totalDebitVirtualValues'] ?? {},
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'identifier': identifier,
      'tenantId': tenantId,
      'currency': currency,
      'amounts': amounts,
      'totalAmounts': totalAmounts,
      'virtualValues': virtualValues,
      'totalVirtualValues': totalVirtualValues,
      'transactionsCount': transactionsCount,
      'totalTransactionsCount': totalTransactionsCount,
      'creditAmounts': creditAmounts,
      'totalCreditAmounts': totalCreditAmounts,
      'creditVirtualValues': creditVirtualValues,
      'totalCreditVirtualValues': totalCreditVirtualValues,
      'debitAmounts': debitAmounts,
      'totalDebitAmounts': totalDebitAmounts,
      'debitVirtualValues': debitVirtualValues,
      'totalDebitVirtualValues': totalDebitVirtualValues,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

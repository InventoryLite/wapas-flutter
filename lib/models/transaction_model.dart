//TODO: fix model
// class Transaction {
//   String? message;

//   Transaction({this.message});

//   Transaction.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     return data;
//   }
// }

class TransactionModel {
  String? date;
  String? currency;
  Map<String, dynamic>? groupedAmounts;
  Map<String, dynamic>? totalAmounts;
  Map<String, dynamic>? groupedVirtualValues;
  Map<String, dynamic>? totalVirtualValues;
  Map<String, dynamic>? groupedCreditAmounts;
  Map<String, dynamic>? totalCreditAmounts;
  Map<String, dynamic>? groupedCreditVirtualValues;
  Map<String, dynamic>? totalCreditVirtualValues;
  Map<String, dynamic>? groupedDebitAmounts;
  Map<String, dynamic>? totalDebitAmounts;
  Map<String, dynamic>? groupedDebitVirtualValues;
  Map<String, dynamic>? totalDebitVirtualValues;
  Map<String, dynamic>? groupedTransactions;
  Map<String, dynamic>? totalTransactions;
  int? groupBy;

  TransactionModel({
    this.date,
    this.currency,
    this.groupedAmounts,
    this.totalAmounts,
    this.groupedVirtualValues,
    this.totalVirtualValues,
    this.groupedCreditAmounts,
    this.totalCreditAmounts,
    this.groupedCreditVirtualValues,
    this.totalCreditVirtualValues,
    this.groupedDebitAmounts,
    this.totalDebitAmounts,
    this.groupedDebitVirtualValues,
    this.totalDebitVirtualValues,
    this.groupedTransactions,
    this.totalTransactions,
    this.groupBy,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      date: json['date'],
      currency: json['currency'],
      groupedAmounts: json['groupedAmounts'],
      totalAmounts: json['totalAmounts'],
      groupedVirtualValues: json['groupedVirtualValues'],
      totalVirtualValues: json['totalVirtualValues'],
      groupedCreditAmounts: json['groupedCreditAmounts'],
      totalCreditAmounts: json['totalCreditAmounts'],
      groupedCreditVirtualValues: json['groupedCreditVirtualValues'],
      totalCreditVirtualValues: json['totalCreditVirtualValues'],
      groupedDebitAmounts: json['groupedDebitAmounts'],
      totalDebitAmounts: json['totalDebitAmounts'],
      groupedDebitVirtualValues: json['groupedDebitVirtualValues'],
      totalDebitVirtualValues: json['totalDebitVirtualValues'],
      groupedTransactions: json['groupedTransactions'],
      totalTransactions: json['totalTransactions'],
      groupBy: json['groupBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'currency': currency,
      'groupedAmounts': groupedAmounts,
      'totalAmounts': totalAmounts,
      'groupedVirtualValues': groupedVirtualValues,
      'totalVirtualValues': totalVirtualValues,
      'groupedCreditAmounts': groupedCreditAmounts,
      'totalCreditAmounts': totalCreditAmounts,
      'groupedCreditVirtualValues': groupedCreditVirtualValues,
      'totalCreditVirtualValues': totalCreditVirtualValues,
      'groupedDebitAmounts': groupedDebitAmounts,
      'totalDebitAmounts': totalDebitAmounts,
      'groupedDebitVirtualValues': groupedDebitVirtualValues,
      'totalDebitVirtualValues': totalDebitVirtualValues,
      'groupedTransactions': groupedTransactions,
      'totalTransactions': totalTransactions,
      'groupBy': groupBy,
    };
  }
}

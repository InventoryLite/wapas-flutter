class TransactionProfileModel {
  String? id;
  String? identifier;
  String? currency;
  bool? isBlocked;
  int? minTransactionAmount;
  int? maxTransactionAmount;
  int? minTransactionVirtualValue;
  int? maxTransactionVirtualValue;
  int? stepAmount;
  int? stepVirtualValue;
  Map<String, dynamic>? transactionTypesAmount;
  Map<String, dynamic>? transactionTypesCategories;
  Map<String, dynamic>? transactionTypesVirtualValue;
  Map<String, dynamic>? additionalData;
  String? importHash;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? tenantId;
  String? createdById;
  String? updatedById;

  TransactionProfileModel({
    this.id,
    this.identifier,
    this.currency,
    this.isBlocked,
    this.minTransactionAmount,
    this.maxTransactionAmount,
    this.minTransactionVirtualValue,
    this.maxTransactionVirtualValue,
    this.stepAmount,
    this.stepVirtualValue,
    this.transactionTypesAmount,
    this.transactionTypesCategories,
    this.transactionTypesVirtualValue,
    this.additionalData,
    this.importHash,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tenantId,
    this.createdById,
    this.updatedById,
  });

  factory TransactionProfileModel.fromJson(Map<String, dynamic> json) {
    return TransactionProfileModel(
      id: json['id'],
      identifier: json['identifier'],
      currency: json['currency'],
      isBlocked: json['isBlocked'],
      minTransactionAmount: json['minTransactionAmount'],
      maxTransactionAmount: json['maxTransactionAmount'],
      minTransactionVirtualValue: json['minTransactionVirtualValue'],
      maxTransactionVirtualValue: json['maxTransactionVirtualValue'],
      stepAmount: json['stepAmount'],
      stepVirtualValue: json['stepVirtualValue'],
      transactionTypesAmount: json['transactionTypesAmount'],
      transactionTypesCategories: json['transactionTypesCategories'],
      transactionTypesVirtualValue: json['transactionTypesVirtualValue'],
      additionalData: json['additionalData'],
      importHash: json['importHash'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      tenantId: json['tenantId'],
      createdById: json['createdById'],
      updatedById: json['updatedById'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'identifier': identifier,
      'currency': currency,
      'isBlocked': isBlocked,
      'minTransactionAmount': minTransactionAmount,
      'maxTransactionAmount': maxTransactionAmount,
      'minTransactionVirtualValue': minTransactionVirtualValue,
      'maxTransactionVirtualValue': maxTransactionVirtualValue,
      'stepAmount': stepAmount,
      'stepVirtualValue': stepVirtualValue,
      'transactionTypesAmount': transactionTypesAmount,
      'transactionTypesCategories': transactionTypesCategories,
      'transactionTypesVirtualValue': transactionTypesVirtualValue,
      'additionalData': additionalData,
      'importHash': importHash,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'tenantId': tenantId,
      'createdById': createdById,
      'updatedById': updatedById,
    };
  }
}

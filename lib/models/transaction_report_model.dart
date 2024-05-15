class TransactionReportModel {
  String? id;
  bool? isCredit;
  String? reference;
  String? paymentMethod;
  String? remark;
  String? description;
  String? productId;
  String? productName;
  String? sku;
  String? payerId;
  String? payerName;
  String? payeeId;
  String? payeeName;
  String? onBehalfOfId;
  String? onBehalfOfName;
  String? additionalData;
  String? transactionDate;
  String? createdAt;
  String? updatedAt;
  String? transactionTypeIdentifier;
  String? tenantId;
  String? createdById;
  String? updatedById;
  String? currency;
  TransactionTypeDetail? transactionTypeDetail;
  CurrencyDetail? currencyDetail;
  String? virtualValue;
  int? amount;
  String? baseTransaction;
  String? partnerLevelTypeIdentifier;
  Metadata? metadata;

  TransactionReportModel(
      {this.id,
      this.isCredit,
      this.reference,
      this.paymentMethod,
      this.remark,
      this.description,
      this.productId,
      this.productName,
      this.sku,
      this.payerId,
      this.payerName,
      this.payeeId,
      this.payeeName,
      this.onBehalfOfId,
      this.onBehalfOfName,
      this.additionalData,
      this.transactionDate,
      this.createdAt,
      this.updatedAt,
      this.transactionTypeIdentifier,
      this.tenantId,
      this.createdById,
      this.updatedById,
      this.currency,
      this.transactionTypeDetail,
      this.currencyDetail,
      this.virtualValue,
      this.amount,
      this.baseTransaction,
      this.partnerLevelTypeIdentifier,
      this.metadata});

  TransactionReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isCredit = json['isCredit'];
    reference = json['reference'];
    paymentMethod = json['paymentMethod'];
    remark = json['remark'];
    description = json['description'];
    productId = json['productId'];
    productName = json['productName'];
    sku = json['sku'];
    payerId = json['payerId'];
    payerName = json['payerName'];
    payeeId = json['payeeId'];
    payeeName = json['payeeName'];
    onBehalfOfId = json['onBehalfOfId'];
    onBehalfOfName = json['onBehalfOfName'];
    additionalData = json['additionalData'];
    transactionDate = json['transactionDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    transactionTypeIdentifier = json['transactionTypeIdentifier'];
    tenantId = json['tenantId'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    currency = json['currency'];
    transactionTypeDetail = json['transactionTypeDetail'] != null
        ? new TransactionTypeDetail.fromJson(json['transactionTypeDetail'])
        : null;
    currencyDetail = json['currencyDetail'] != null
        ? new CurrencyDetail.fromJson(json['currencyDetail'])
        : null;
    virtualValue = json['virtualValue'];
    amount = json['amount'];
    baseTransaction = json['baseTransaction'];
    partnerLevelTypeIdentifier = json['partnerLevelTypeIdentifier'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isCredit'] = this.isCredit;
    data['reference'] = this.reference;
    data['paymentMethod'] = this.paymentMethod;
    data['remark'] = this.remark;
    data['description'] = this.description;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['sku'] = this.sku;
    data['payerId'] = this.payerId;
    data['payerName'] = this.payerName;
    data['payeeId'] = this.payeeId;
    data['payeeName'] = this.payeeName;
    data['onBehalfOfId'] = this.onBehalfOfId;
    data['onBehalfOfName'] = this.onBehalfOfName;
    data['additionalData'] = this.additionalData;
    data['transactionDate'] = this.transactionDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['transactionTypeIdentifier'] = this.transactionTypeIdentifier;
    data['tenantId'] = this.tenantId;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    data['currency'] = this.currency;
    if (this.transactionTypeDetail != null) {
      data['transactionTypeDetail'] = this.transactionTypeDetail!.toJson();
    }
    if (this.currencyDetail != null) {
      data['currencyDetail'] = this.currencyDetail!.toJson();
    }
    data['virtualValue'] = this.virtualValue;
    data['amount'] = this.amount;
    data['baseTransaction'] = this.baseTransaction;
    data['partnerLevelTypeIdentifier'] = this.partnerLevelTypeIdentifier;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class TransactionTypeDetail {
  String? id;
  String? identifier;
  String? name;
  String? importHash;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? tenantId;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? category;
  List<String>? identifierAlias;
  String? partnerId;

  TransactionTypeDetail(
      {this.id,
      this.identifier,
      this.name,
      this.importHash,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.tenantId,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.category,
      this.identifierAlias,
      this.partnerId});

  TransactionTypeDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    identifier = json['identifier'];
    name = json['name'];
    importHash = json['importHash'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    tenantId = json['tenantId'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    isActive = json['isActive'];
    category = json['category'];
    identifierAlias = json['identifierAlias'].cast<String>();
    partnerId = json['partnerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['identifier'] = this.identifier;
    data['name'] = this.name;
    data['importHash'] = this.importHash;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['tenantId'] = this.tenantId;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    data['isActive'] = this.isActive;
    data['category'] = this.category;
    data['identifierAlias'] = this.identifierAlias;
    data['partnerId'] = this.partnerId;
    return data;
  }
}

class CurrencyDetail {
  String? id;
  String? name;
  bool? isActive;
  String? importHash;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? tenantId;
  String? createdById;
  String? updatedById;
  String? iso;
  String? denomination;
  String? denominator;
  String? denominationSeparator;
  String? virtualValueConversion;
  String? stepAmount;
  String? stepVirtualValue;

  CurrencyDetail(
      {this.id,
      this.name,
      this.isActive,
      this.importHash,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.tenantId,
      this.createdById,
      this.updatedById,
      this.iso,
      this.denomination,
      this.denominator,
      this.denominationSeparator,
      this.virtualValueConversion,
      this.stepAmount,
      this.stepVirtualValue});

  CurrencyDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['isActive'];
    importHash = json['importHash'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    tenantId = json['tenantId'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    iso = json['iso'];
    denomination = json['denomination'];
    denominator = json['denominator'];
    denominationSeparator = json['denominationSeparator'];
    virtualValueConversion = json['virtualValueConversion'];
    stepAmount = json['stepAmount'];
    stepVirtualValue = json['stepVirtualValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isActive'] = this.isActive;
    data['importHash'] = this.importHash;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['tenantId'] = this.tenantId;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    data['iso'] = this.iso;
    data['denomination'] = this.denomination;
    data['denominator'] = this.denominator;
    data['denominationSeparator'] = this.denominationSeparator;
    data['virtualValueConversion'] = this.virtualValueConversion;
    data['stepAmount'] = this.stepAmount;
    data['stepVirtualValue'] = this.stepVirtualValue;
    return data;
  }
}

class Metadata {
  String? amount;
  String? amount2;
  String? account2Identifier;
  bool? isMultiTransaction;

  Metadata(
      {this.amount,
      this.amount2,
      this.account2Identifier,
      this.isMultiTransaction});

  Metadata.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    amount2 = json['amount2'];
    account2Identifier = json['account2Identifier'];
    isMultiTransaction = json['isMultiTransaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['amount2'] = this.amount2;
    data['account2Identifier'] = this.account2Identifier;
    data['isMultiTransaction'] = this.isMultiTransaction;
    return data;
  }
}

class PartnerHierarchyModel {
  String? partnerId;
  String? partnerName;
  String? parentId;
  int? level;
  String? partnerLevelTypeIdentifier;
  String? levelName;
  int? childrenCount;
  AdditionalData? additionalData;
  String? relativeLevelIdentifier;
  String? relativeLevelName;
  String? partnerCreatedAt;
  TransactionTypesAmount? transactionTypesAmount;

  PartnerHierarchyModel({
    this.partnerId,
    this.partnerName,
    this.parentId,
    this.level,
    this.partnerLevelTypeIdentifier,
    this.levelName,
    this.childrenCount,
    this.additionalData,
    this.relativeLevelIdentifier,
    this.relativeLevelName,
    this.transactionTypesAmount,
    this.partnerCreatedAt,
  });

  PartnerHierarchyModel.fromJson(Map<String, dynamic> json) {
    partnerId = json['partnerId'];
    partnerName = json['partnerName'];
    parentId = json['parentId'];
    level = json['level'];
    partnerLevelTypeIdentifier = json['partnerLevelTypeIdentifier'];
    levelName = json['levelName'];
    childrenCount = json['childrenCount'];
    additionalData = json['additionalData'] != null
        ? new AdditionalData.fromJson(json['additionalData'])
        : null;
    relativeLevelIdentifier = json['relativeLevelIdentifier'];
    relativeLevelName = json['relativeLevelName'];
    transactionTypesAmount = json['transactionTypesAmount'] != null
        ? new TransactionTypesAmount.fromJson(json['transactionTypesAmount'])
        : null;
    partnerCreatedAt = json['partnerCreatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partnerId'] = this.partnerId;
    data['partnerName'] = this.partnerName;
    data['parentId'] = this.parentId;
    data['level'] = this.level;
    data['partnerLevelTypeIdentifier'] = this.partnerLevelTypeIdentifier;
    data['levelName'] = this.levelName;
    data['childrenCount'] = this.childrenCount;
    if (this.additionalData != null) {
      data['additionalData'] = this.additionalData!.toJson();
    }
    data['relativeLevelIdentifier'] = this.relativeLevelIdentifier;
    data['relativeLevelName'] = this.relativeLevelName;
    if (this.transactionTypesAmount != null) {
      data['transactionTypesAmount'] = this.transactionTypesAmount!.toJson();
    }
    data['partnerCreatedAt'] = this.partnerCreatedAt;
    return data;
  }
}

class AdditionalData {
  String? email;
  String? fullName;

  AdditionalData({this.email, this.fullName});

  AdditionalData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    return data;
  }
}

class TransactionTypesAmount {
  double? rEDEEMABLE;
  double? dCOMMISSION;

  TransactionTypesAmount({this.rEDEEMABLE, this.dCOMMISSION});

  TransactionTypesAmount.fromJson(Map<String, dynamic> json) {
    rEDEEMABLE = json['REDEEMABLE'];
    dCOMMISSION = json['_COMMISSION_'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['REDEEMABLE'] = this.rEDEEMABLE;
    data['_COMMISSION_'] = this.dCOMMISSION;
    return data;
  }
}

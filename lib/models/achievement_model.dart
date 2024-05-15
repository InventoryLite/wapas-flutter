class AchievementModel {
  final String? expiryDate;
  final String? id;
  final String? identifier;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? iconLink;
  final String? targetType;
  final int? target;
  final String? webhookUrl;
  final String? webhookPostBodyCredentials;
  final String? expiry;
  final String? expiryDays;
  final bool? accumulate;
  final bool? isActive;
  final String? levelOrderNumber;
  final bool? canOptOut;
  final Metadata? metadata;
  final String? levelProgressFactor;
  final Metadata? transactionRewardDetail;
  final String? importHash;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deletedAt;
  final String? tenantId;
  final String? createdById;
  final String? updatedById;
  // final List<dynamic>? icon;

  AchievementModel({
    this.expiryDate,
    this.id,
    this.identifier,
    this.title,
    this.subTitle,
    this.description,
    this.iconLink,
    this.targetType,
    this.target,
    this.webhookUrl,
    this.webhookPostBodyCredentials,
    this.expiry,
    this.expiryDays,
    this.accumulate,
    this.isActive,
    this.levelOrderNumber,
    this.canOptOut,
    this.metadata,
    this.levelProgressFactor,
    this.transactionRewardDetail,
    this.importHash,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tenantId,
    this.createdById,
    this.updatedById,
    // this.icon,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      expiryDate: json["expiryDate"],
      id: json["id"],
      identifier: json["identifier"],
      title: json["title"],
      subTitle: json["subTitle"],
      description: json["description"],
      iconLink: json["iconLink"],
      targetType: json["targetType"],
      target: json["target"],
      webhookUrl: json["webhookURL"],
      webhookPostBodyCredentials: json["webhookPostBodyCredentials"],
      expiry: json["expiry"],
      expiryDays: json["expiryDays"],
      accumulate: json["accumulate"],
      isActive: json["isActive"],
      levelOrderNumber: json["levelOrderNumber"],
      canOptOut: json["canOptOut"],
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      levelProgressFactor: json["levelProgressFactor"],
      transactionRewardDetail: json["transactionRewardDetail"] == null
          ? null
          : Metadata.fromJson(json["transactionRewardDetail"]),
      importHash: json["importHash"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      deletedAt: json["deletedAt"],
      tenantId: json["tenantId"],
      createdById: json["createdById"],
      updatedById: json["updatedById"],
      // icon: json["icon"] == null
      //     ? []
      //     : List<dynamic>.from(json["icon"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "expiryDate": expiryDate,
        "id": id,
        "identifier": identifier,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "iconLink": iconLink,
        "targetType": targetType,
        "target": target,
        "webhookURL": webhookUrl,
        "webhookPostBodyCredentials": webhookPostBodyCredentials,
        "expiry": expiry,
        "expiryDays": expiryDays,
        "accumulate": accumulate,
        "isActive": isActive,
        "levelOrderNumber": levelOrderNumber,
        "canOptOut": canOptOut,
        "metadata": metadata?.toJson(),
        "levelProgressFactor": levelProgressFactor,
        "transactionRewardDetail": transactionRewardDetail?.toJson(),
        "importHash": importHash,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "tenantId": tenantId,
        "createdById": createdById,
        "updatedById": updatedById,
        // "icon": icon.map((x) => x).toList(),
      };
}

class Metadata {
  Metadata({this.json});
  final Map<String, dynamic>? json;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(json: json);
  }

  Map<String, dynamic> toJson() => {};
}

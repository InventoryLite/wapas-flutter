import 'package:wapas/models/achievement_model.dart';

class UserAchievementModel {
  String? validUpTo;
  String? id;
  String? achieverId;
  String? achieverName;
  bool? isAcknowledged;
  String? acknowledgedAt;
  String? uniqueReference;
  String? achievementIdentifier;
  String? progress;
  bool? optOut;
  Map<String, dynamic>? additionalData;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? updatedById;
  AchievementModel? achievement;

  UserAchievementModel(
      {this.validUpTo,
      this.id,
      this.achieverId,
      this.achieverName,
      this.isAcknowledged,
      this.acknowledgedAt,
      this.uniqueReference,
      this.achievementIdentifier,
      this.progress,
      this.optOut,
      this.additionalData,
      this.createdAt,
      this.updatedAt,
      this.createdById,
      this.updatedById,
      this.achievement});

  UserAchievementModel.fromJson(Map<String, dynamic> json) {
    validUpTo = json['validUpTo'];
    id = json['id'];
    achieverId = json['achieverId'];
    achieverName = json['achieverName'];
    isAcknowledged = json['isAcknowledged'];
    acknowledgedAt = json['acknowledgedAt'];
    uniqueReference = json['uniqueReference'];
    achievementIdentifier = json['achievementIdentifier'];
    progress = json['progress'];
    optOut = json['optOut'];
    additionalData = json['additionalData'] ?? {};
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    achievement = json["achievement"] == null
        ? null
        : AchievementModel.fromJson(json["achievement"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['validUpTo'] = this.validUpTo;
    data['id'] = this.id;
    data['achieverId'] = this.achieverId;
    data['achieverName'] = this.achieverName;
    data['isAcknowledged'] = this.isAcknowledged;
    data['acknowledgedAt'] = this.acknowledgedAt;
    data['uniqueReference'] = this.uniqueReference;
    data['achievementIdentifier'] = this.achievementIdentifier;
    data['progress'] = this.progress;
    data['optOut'] = this.optOut;
    data['additionalData'] = this.additionalData;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    if (this.achievement != null) {
      data['achievement'] = this.achievement!.toJson();
    }
    return data;
  }
}

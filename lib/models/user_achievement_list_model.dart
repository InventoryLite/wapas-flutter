import 'package:wapas/models/user_achievement_model.dart';

class UserAchievementListModel {
  List<UserAchievementModel>? rows;
  int? count;

  UserAchievementListModel({this.rows, this.count});

  UserAchievementListModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <UserAchievementModel>[];
      json['rows'].forEach((v) {
        rows!.add(new UserAchievementModel.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

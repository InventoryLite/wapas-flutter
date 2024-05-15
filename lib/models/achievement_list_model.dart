//TODO: fix model
import 'package:wapas/models/achievement_model.dart';

class AchievementList {
  List<AchievementModel>? rows;
  int? count;

  AchievementList({this.rows, this.count});

  AchievementList.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <AchievementModel>[];
      json['rows'].forEach((v) {
        rows!.add(new AchievementModel.fromJson(v));
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

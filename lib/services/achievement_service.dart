import 'dart:convert';

import 'package:wapas/constants.dart';
import 'package:wapas/models/achievement_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:wapas/models/config_model.dart';
import 'package:wapas/models/user_achievement_list_model.dart';
import 'package:wapas/models/user_achievement_model.dart';

Future<AchievementList> fetchAvailableAchievements(
    int limit, int offset, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/get-achievement?limit=${limit > 0 ? limit : config.limit}&offset=${offset > 0 ? offset : config.offset}';

  final response = await http.post(Uri.parse(path),
      body: jsonEncode(<String, String>{
        "application_id": config.applicationId,
        "client_secret": config.clientSecret,
        "client_id": config.clientId,
        "version": config.version,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var rb = response.body;

    // store json data into list
    var achievementResponse = jsonDecode(rb) as Map<String, dynamic>;

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    AchievementList achievementList = AchievementList.fromJson(
      achievementResponse,
    );

    return achievementList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch available achievements');
  }
}

Future<List<UserAchievementModel>> fetchUserchievements(
    String userId, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/user-achievements/get-active/$userId';

  final response = await http.post(Uri.parse(path),
      body: jsonEncode(<String, String>{
        "application_id": config.applicationId,
        "client_secret": config.clientSecret,
        "client_id": config.clientId,
        "version": config.version,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var rb = response.body;

    // store json data into list
    var list = jsonDecode(rb);

    List<UserAchievementModel> items = [];

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    items = list == null
        ? items
        : list
            .map<UserAchievementModel>((i) => UserAchievementModel.fromJson(i))
            .toList();

    return items;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch user achievements');
  }
}

Future<UserAchievementListModel> fetchUnacknowledgedAchievements(
    String userId, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/user-achievements/get-unacknowledged/$userId';

  final response = await http.post(Uri.parse(path),
      body: jsonEncode(<String, String>{
        "application_id": config.applicationId,
        "client_secret": config.clientSecret,
        "client_id": config.clientId,
        "version": config.version,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var rb = response.body;

    // store json data into list
    var achievementResponse = jsonDecode(rb) as Map<String, dynamic>;

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    UserAchievementListModel achievementList =
        UserAchievementListModel.fromJson(
      achievementResponse,
    );

    return achievementList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch available achievements');
  }
}

Future<UserAchievementListModel> acknowledgeUserAchievement(
    String userId, String achievementId, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/user-achievements/acknowledge/$userId/$achievementId';

  final response = await http.post(Uri.parse(path),
      body: jsonEncode(<String, String>{
        "application_id": config.applicationId,
        "client_secret": config.clientSecret,
        "client_id": config.clientId,
        "version": config.version,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var rb = response.body;

    // store json data into list
    var achievementResponse = jsonDecode(rb) as Map<String, dynamic>;

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    UserAchievementListModel achievementList =
        UserAchievementListModel.fromJson(
      achievementResponse,
    );

    return achievementList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch available achievements');
  }
}

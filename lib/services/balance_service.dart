import 'dart:convert';

import 'package:wapas/constants.dart';
import 'package:wapas/models/balance_history_list_model.dart';
import 'package:wapas/models/balance_model.dart';
import 'package:wapas/models/config_model.dart';
import 'package:http/http.dart' as http;

Future<List<BalanceModel>> fetchBalance(
    String userId, String currency, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/get-current-balances-for-transaction-types?filter%5BuserId%5D=$userId&filter%5Bcurrency%5D=$currency';

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

    List<BalanceModel> items = [];

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    items = list == null
        ? items
        : list.map<BalanceModel>((i) => BalanceModel.fromJson(i)).toList();

    return items;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch balance');
  }
}

Future<BalanceHistoryListModel> fetchBalanceHistory(String userId,
    String currency, String startDate, String endDate, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/get-partner-balances-report-by-date?filter%5BuserId%5D=$userId&filter%5Bcurrency%5D=$currency&filter%5BdateRange%5D%5B%5D=$startDate&filter%5BdateRange%5D%5B%5D=$endDate';

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
    var jsonResponse = jsonDecode(rb);

    BalanceHistoryListModel balanceHistoryListModel =
        BalanceHistoryListModel.fromJson(jsonResponse);

    return balanceHistoryListModel;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch balance');
  }
}

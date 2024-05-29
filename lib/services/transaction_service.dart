import 'dart:convert';

import 'package:wapas/constants.dart';
import 'package:wapas/models/config_model.dart';
import 'package:http/http.dart' as http;
import 'package:wapas/models/transaction_profile_model.dart';
import 'package:wapas/models/transactions_list_model.dart';

Future<TransactionProfileModel> fetchTransactionProfile(
    String userId, String currency, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/get-transaction-profile-by-identifier-for-currency/$userId/$currency';

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
    var jsonResponse = jsonDecode(rb);

    TransactionProfileModel transactionProfile =
        TransactionProfileModel.fromJson(jsonResponse);

    return transactionProfile;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch transactiun profile');
  }
}

Future<TransactionListModel> fetchTransactions(
    int limit, int offset, String? filter, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/get-transaction?limit=$limit&offset=$offset&${filter ?? ""}';

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
    var jsonResponse = jsonDecode(rb);

    TransactionListModel transactions =
        TransactionListModel.fromJson(jsonResponse);

    return transactions;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch transactions');
  }
}

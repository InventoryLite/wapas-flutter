import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wapas/constants.dart';
import 'package:wapas/models/config_model.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/models/transaction_report_list_model.dart';

//TODO check model
Future<List<TransactionModel>> fetchBalanceReport(
    String userId,
    String currency,
    String startDate,
    String endDate,
    String group,
    bool includePrevious,
    bool includeToday,
    Config config) async {
  String path =
      '${constants.REPORTING_API_HOST}/tenant/${config.applicationId}/reports/getbalances?filter%5BPartnerId%5D=$userId&filter%5Bcurrency%5D=$currency&filter%5BDateRange%5D%5B%5D=$startDate&filter%5BDateRange%5D%5B%5D=$endDate&group=$group&includePrevious=$includePrevious&includeToday=$includeToday';

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

    List<TransactionModel> items = [];

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    items = list == null
        ? items
        : list
            .map<TransactionModel>((i) => TransactionModel.fromJson(i))
            .toList();

    return items;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch balance');
  }
}

Future<TransactionReportListModel> fetchTransactionsReport(
  String? filter,
  String? startDate,
  String? endDate,
  bool? suspense,
  int? limit,
  Config config,
) async {
  String filterQuery = filter ?? "";
  String startingDate =
      startDate != null ? "&filter[CreatedAtRange]=$startDate" : "&";
  String endingDate =
      endDate != null ? "&filter[CreatedAtRange]=$endDate" : "&";
  String suspensed = suspense != null ? "&suspense=$suspense" : "&";
  String limitValue = limit != null ? "&Limit=${limit}" : "&";

  String path =
      '${constants.REPORTING_API_HOST}/tenant/${config.applicationId}/transactions?$filterQuery$startingDate$endingDate$suspensed$limitValue';

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

    TransactionReportListModel transactions =
        TransactionReportListModel.fromJson(jsonResponse);

    return transactions;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch balance');
  }
}

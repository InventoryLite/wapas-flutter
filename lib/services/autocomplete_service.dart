import 'dart:convert';

import '../constants.dart';
import 'package:http/http.dart' as http;
import '../models/autocomplete_model.dart';
import '../models/config_model.dart';

Future<List<AutocompleteModel>> fetchCurrencyTypes(
    String? userId, Config config) async {
  String filter = "";
  if (userId != null) {
    filter = "?filter%5BuserId%5D=$userId";
  }
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/get-currency-autocomplete$filter';

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

    List<AutocompleteModel> items = [];

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    items = list == null
        ? items
        : list
            .map<AutocompleteModel>((i) => AutocompleteModel.fromJson(i))
            .toList();

    return items;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch currency types');
  }
}

Future<List<AutocompleteModel>> fetchTransactionTypes(
    String? userId, Config config) async {
  String filter = "";
  if (userId != null) {
    filter = "?filter%5BuserId%5D=$userId";
  }
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/get-transaction-type-autocomplete$filter';

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

    List<AutocompleteModel> items = [];

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    items = list == null
        ? items
        : list
            .map<AutocompleteModel>((i) => AutocompleteModel.fromJson(i))
            .toList();

    return items;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch currency types');
  }
}

// Future<List<AutocompleteModel>> fetchAmountTypes(Config config) async {
//   String path =
//       '${constants.API_HOST}/tenant/${config.applicationId}/get-currency-autocomplete';

//   final response = await http.post(Uri.parse(path),
//       body: jsonEncode(<String, String>{
//         "application_id": config.applicationId,
//         "client_secret": config.clientSecret,
//         "client_id": config.clientId,
//         "version": config.version,
//       }),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       });

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     var rb = response.body;

//     // store json data into list
//     var list = jsonDecode(rb);

//     List<Autocomplete> items = [];

//     // iterate over the list and map each object in list to Img by calling Img.fromJson
//     items = list == null
//         ? items
//         : list
//             .map<AutocompleteModel>((i) => AutocompleteModel.fromJson(i))
//             .toList();

//     return items;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to fetch currency types');
//   }
// }

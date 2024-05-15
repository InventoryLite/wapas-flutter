import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wapas/constants.dart';
import 'package:wapas/models/config_model.dart';

// Future<List<TransactionModel>> fetchPartnerHierarchy(
//     String userId,
//     String? hierarchyType,
//     String? uptoPartner,
//     int? forLevel,
//     int? limit,
//     int? skip,
//     String? orderByRank,
//     String? orderByCount,
//     String? relativeTo,
//     Config config) async {
//   String path =
//       '${constants.API_HOST}/tenant/${config.applicationId}/partners-hierarchy/$userId';

//   Map<String, dynamic> data = {
//     "hierarchyType": hierarchyType ?? "CHILDREN",
//   };
//   if (uptoPartner != null) {
//     data["uptoPartner"] = uptoPartner;
//   }
//   if (forLevel != null) {
//     data["forLevel"] = forLevel;
//   }
//   if (limit != null) {
//     data["limit"] = limit;
//   }
//   if (skip != null) {
//     data["skip"] = skip;
//   }
//   if (orderByRank != null) {
//     data["orderByRank"] = orderByRank;
//   }
//   if (orderByCount != null) {
//     data["orderByCount"] = orderByCount;
//   }
//   if (relativeTo != null) {
//     data["relativeTo"] = relativeTo;
//   }

//   final response = await http.post(Uri.parse(path),
//       body: jsonEncode(<String, dynamic>{
//         "application_id": config.applicationId,
//         "client_secret": config.clientSecret,
//         "client_id": config.clientId,
//         "version": config.version,
//         "data": data,
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

//     List<TransactionModel> items = [];

//     // iterate over the list and map each object in list to Img by calling Img.fromJson
//     items = list == null
//         ? items
//         : list
//             .map<TransactionModel>((i) => TransactionModel.fromJson(i))
//             .toList();

//     return items;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to fetch balance');
//   }
// }

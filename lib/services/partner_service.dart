import 'dart:convert';
import 'package:wapas/constants.dart';
import 'package:http/http.dart' as http;
import 'package:wapas/models/config_model.dart';

Future<bool> createPartner(Map<String, dynamic> payload, Config config) async {
  String path =
      '${constants.API_HOST}/tenant/${config.applicationId}/save-partners';

  final response = await http.post(Uri.parse(path),
      body: jsonEncode(<String, dynamic>{
        "application_id": config.applicationId,
        "client_secret": config.clientSecret,
        "client_id": config.clientId,
        "version": config.version,
        "data": payload,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {
    return true;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to save partner');
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:my_diary/models/journal.dart';

import 'http_interceptors.dart';

class JournalService {
  static const String url = 'http://localhost:3000/';
  static const String resource = "journals/";

  http.Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return '$url$resource';
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = jsonEncode(journal.toMap());

    http.Response response = await client.post(
        Uri.parse(getUrl()),
        headers: {'Content-Type': 'application/json'},
        body: jsonJournal
    );

    return response.statusCode == 201;
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    return response.body;
  }
}
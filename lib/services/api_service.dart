import 'package:search_engine_git/models/git_request.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<GitRequest> getGitInfo(String name) async {
    String url = 'https://api.github.com/users';

    final response = await http.get(Uri.parse("$url/$name"));

    if (response.statusCode == 200) {
      GitRequest futureGitRequest =
          GitRequest.fromJson(jsonDecode(response.body));
      return futureGitRequest;
    } else {
      throw Exception("Failed to load info");
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert'; // JSON

// 接続先のAPI
class API {
  String path(int id) {
    return "/api/fruits/" + id.toString();
  }
}

// リクエスト
class Request {
  Request();
  // Class -> JSON
  dynamic toJson() {
    return {};
  }
}

// レスポンス
class Response {
  // JSON -> Class
  Response.fromJson(dynamic rawJson);
}

// リクエスト送信
Future<Response> sendRequest(int id, Request request) async {
  var urlString = "http://0.0.0.0:8000" + API().path(id);
  var url = Uri.parse(urlString);
  final response = await http.delete(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    // utf8で受け取る
    final rawString = utf8.decode(response.bodyBytes);
    dynamic rawJson = json.decode(rawString);
    return Response.fromJson(rawJson);
  } else {
    throw ("error");
  }
}

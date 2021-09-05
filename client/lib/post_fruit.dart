import 'package:http/http.dart' as http;
import 'dart:convert'; // JSON
import 'fruit.dart';

// 接続先のAPI
class API {
  String path() {
    return "/api/fruits";
  }
}

// リクエスト
class Request {
  final Fruit fruit;
  Request(this.fruit);

  // Class -> JSON
  dynamic toJson() {
    return {
      'fruit': fruit.toJson(),
    };
  }
}

// レスポンス
class Response {
  Response();
  // JSON -> Class
  Response.fromJson(dynamic rawJson);
}

// リクエスト送信
Future<Response> sendRequest(Request request) async {
  var urlString = "http://0.0.0.0:8000" + API().path();
  var url = Uri.parse(urlString);
  final response = await http.post(
    url,
    body: json.encode(request.fruit.toJson()),
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

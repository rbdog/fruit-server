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
  Request();

  // Class -> JSON
  dynamic toJson() {
    return {};
  }
}

// レスポンス
class Response {
  List<Fruit> fruits = [];

  // JSON -> Class
  Response.fromJson(dynamic rawJson) {
    List<dynamic> list = rawJson;
    this.fruits = list.map((fruit) => Fruit.fromJson(fruit)).toList();
  }
}

// リクエスト送信
Future<Response> sendRequest(Request request) async {
  var urlString = "http://0.0.0.0:8000" + API().path();
  var url = Uri.parse(urlString);
  final response = await http.get(
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

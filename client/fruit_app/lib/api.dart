import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import './fruit.dart';

class CommonResponse {
  final String msg;
  final String statusCode;
  CommonResponse({required this.msg, required this.statusCode});
}

class GetFruitResponse {
  final CommonResponse common;
  final List<Fruit> fruits;

  GetFruitResponse({required this.fruits, required this.common});

  factory GetFruitResponse.fromJson(List<dynamic> jsonFruits, CommonResponse common) {

    List<Fruit> fruits = jsonFruits.map((fruit) {
      return Fruit(
        id: fruit['id'].toString(),
        name: fruit['name'],
        price: fruit['price'],
        createdAt: DateTime.parse(fruit['created_at']),
        updatedAt: DateTime.parse(fruit['updated_at']),
        );
    }).toList();

    return GetFruitResponse(fruits: fruits, common: common);
  }
}

class PostFruitRequest {
  final String name;
  final int price;
  PostFruitRequest({required this.name, required this.price});
  Map<String, dynamic> toJson() => {
        'name': name.toString(),
        'price': price,
      };
}

class PostFruitResponse {
  final CommonResponse common;

  PostFruitResponse({required this.common});

  factory PostFruitResponse.fromJson(CommonResponse common) {
    return PostFruitResponse(common: common);
  }
}

class PatchFruitRequest {
  final int price;
  PatchFruitRequest({required this.price});
  Map<String, dynamic> toJson() => {
        'price': price,
      };
}

class PatchFruitResponse {
  final CommonResponse common;

  PatchFruitResponse({required this.common});

  factory PatchFruitResponse.fromJson(CommonResponse common) {
    return PatchFruitResponse(common: common);
  }
}

class DeleteFruitResponse {
  final CommonResponse common;

  DeleteFruitResponse({required this.common});

  factory DeleteFruitResponse.fromJson(CommonResponse common) {
    return DeleteFruitResponse(common: common);
  }
}

class MyAPI {
  Future<GetFruitResponse> sendGetFruitRequest() async {
    var urlString = "http://0.0.0.0:8000/api/fruits";
    var url = Uri.parse(urlString);

    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {

      // utf8で受け取る
      final reponseJson = utf8.decode(response.bodyBytes);
      List<dynamic> decodedFruits = json.decode(reponseJson);

      return GetFruitResponse.fromJson(
          decodedFruits,
          CommonResponse(
              msg: "Maybe Success",
              statusCode: response.statusCode.toString()));
    } else {
      return GetFruitResponse(
          fruits: [],
          common: CommonResponse(
              msg: "Maybe Failure",
              statusCode: response.statusCode.toString()));
    }
  }

  Future<PostFruitResponse> sendPostFruitRequest(String name, int price) async {
    var urlString = "http://0.0.0.0:8000/api/fruits";
    var url = Uri.parse(urlString);
    var request = new PostFruitRequest(name: name, price: price);
    final response = await http.post(url,
        body: json.encode(request.toJson()),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return PostFruitResponse.fromJson(CommonResponse(
          msg: "Maybe Success", statusCode: response.statusCode.toString()));
    } else {
      return PostFruitResponse.fromJson(CommonResponse(
          msg: "Maybe Failure", statusCode: response.statusCode.toString()));
    }
  }

  Future<PatchFruitResponse> sendPatchFruitRequest(String id, int price) async {
    var urlString = "http://0.0.0.0:8000/api/fruits/$id";
    var url = Uri.parse(urlString);
    var request = new PatchFruitRequest(price: price);
    final response = await http.patch(url,
        body: json.encode(request.toJson()),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return PatchFruitResponse.fromJson(CommonResponse(
          msg: "Maybe Success", statusCode: response.statusCode.toString()));
    } else {
      return PatchFruitResponse.fromJson(CommonResponse(
          msg: "Maybe Failure", statusCode: response.statusCode.toString()));
    }
  }

  Future<DeleteFruitResponse> sendDeleteFruitRequest(String id) async {
    var urlString = "http://0.0.0.0:8000/api/fruits/$id";
    var url = Uri.parse(urlString);
    final response =
        await http.delete(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return DeleteFruitResponse.fromJson(CommonResponse(
          msg: "Maybe Success", statusCode: response.statusCode.toString()));
    } else {
      return DeleteFruitResponse.fromJson(CommonResponse(
          msg: "Maybe Failure", statusCode: response.statusCode.toString()));
    }
  }
}

import 'dart:convert'; // JSON
import 'package:intl/intl.dart'; // DateTime

class Fruit {
  final int id;
  final String name;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Fruit.withID(this.id, this.name, this.price)
      : this.createdAt = DateTime.now(),
        this.updatedAt = DateTime.now();

  Fruit(this.name, this.price)
      : this.id = 0,
        this.createdAt = DateTime.now(),
        this.updatedAt = DateTime.now();

  // JSON -> Class
  Fruit.fromJson(dynamic rawJson)
      : this.id = rawJson['id'],
        this.name = rawJson['name'],
        this.price = rawJson['price'],
        this.createdAt = DateTime.parse(rawJson['created_at']),
        this.updatedAt = DateTime.parse(rawJson['updated_at']);

  // Class -> JSON
  dynamic toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'created_at': DateFormat('yyyy-MM-ddThh:mm:ss').format(this.createdAt),
      'updated_at': DateFormat('yyyy-MM-ddThh:mm:ss').format(this.updatedAt),
    };
  }
}

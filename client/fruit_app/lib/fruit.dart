import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'fruit.g.dart';

/*

- projectディレクトリで実行

```
$ dart pub add json_serializable
```

pubspec.yamlに追加
```
  dependencies:
+   build_runner:
```

- @JsonSerializable() でクラスを作成

- 

``` ファイルに追加
import 'dart:convert';
part '*.g.dart';
```

```
$ flutter pub get
$ flutter packages pub run build_runner build
```

- *.g.dart が作成される

- fromJson, toJson, toStringを追加
- *がわかりにくい箇所にあるので注意

```
factory *.fromJson(Map<String, dynamic> json) => _$*FromJson(json);
Map<String, dynamic> toJson() => _$FruitToJson(this);
@override
  String toString() => json.encode(toJson()); 
```

*/

@JsonSerializable()
class Fruit {
  final String id;
  final String name;
  final int price;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  Fruit(
      {required this.id,
      required this.name,
      required this.price,
      required this.createdAt,
      required this.updatedAt});
  factory Fruit.fromJson(Map<String, dynamic> json) => _$FruitFromJson(json);
  Map<String, dynamic> toJson() => _$FruitToJson(this);
  @override
  String toString() => json.encode(toJson());
}

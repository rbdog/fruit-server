import 'package:flutter/material.dart';
import 'drawer.dart';
import 'request_list.dart';
import 'response_bar.dart';
import 'fruit_table.dart';
import 'fruit.dart';
import 'get_fruits.dart' as GetFruits;
import 'post_fruit.dart' as PostFruit;
import 'patch_fruit.dart' as PatchFruit;
import 'delete_fruit.dart' as DeleteFruit;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Fruit> _fruits = [];
  bool _hasFruits() => _fruits.length > 0;
  var isCallingAPI = false;
  var statusCode = '---';

  void _callGetApi() async {
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });

    final req = GetFruits.Request();
    final res = await GetFruits.sendRequest(req);

    setState(() {
      _fruits = res.fruits;
      this.isCallingAPI = false; // ロード状態終了
      statusCode = '200';
    });
  }

  void _callPostApi(String name, int price) async {
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });

    final newFruit = Fruit(name, price);
    final req = PostFruit.Request(newFruit);
    final res = await PostFruit.sendRequest(req);

    setState(() {
      debugPrint(res.toString());
      this.isCallingAPI = false; // ロード状態終了
      statusCode = '200';
    });
  }

  void _callPatchApi(int id, int price) {
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });

    final newFruit = Fruit.withID(id, 'new', price);
    final req = PatchFruit.Request(newFruit);
    final res = PatchFruit.sendRequest(id, req);

    setState(() {
      debugPrint(res.toString());
      this.isCallingAPI = false; // ロード状態終了
      statusCode = '200';
    });
  }

  void _callDeleteApi(int id) {
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });

    final req = DeleteFruit.Request();
    final res = DeleteFruit.sendRequest(id, req);

    setState(() {
      debugPrint(res.toString());
      this.isCallingAPI = false; // ロード状態終了
      statusCode = '200';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fruit App')),
      drawer: MyDrawer(),
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(width: 400.0),
            child: RequestList(
              onTapGet: () {
                _callGetApi();
              },
              onTapPost: (name, price) {
                _callPostApi(name, int.parse(price));
              },
              onTapPatch: (id, price) {
                _callPatchApi(id, int.parse(price));
              },
              onTapDelete: (id) {
                _callDeleteApi(id);
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ResponseBar(
                  isLoading: this.isCallingAPI,
                  statusCode: this.statusCode,
                ),
                _hasFruits()
                    ? MyTable(
                        fruits: this._fruits,
                      )
                    : MyEmptyTable()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

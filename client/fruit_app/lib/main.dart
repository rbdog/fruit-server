import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './drawer.dart';
import './request_list.dart';
import './response_bar.dart';
import './fruit_table.dart';
import './fruit.dart';
import './api.dart';

void main() {
  initializeDateFormatting('ja_JP');
  runApp(MaterialApp(
      title: 'Fruit App',
      debugShowCheckedModeBanner: false,
      theme: _myTheme(),
      home: MyHome()));
}

ThemeData _myTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryColor: Colors.green,
      accentColor: Colors.greenAccent,
      buttonColor: Colors.greenAccent,
      scaffoldBackgroundColor: Colors.grey[100],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.green)));
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  List<Fruit> _fruits = [];
  bool _hasFruits() => _fruits.length > 0;
  var isCallingAPI = false;
  var statusCode = '---';

  void _callGetApi() {
    var api = new MyAPI();
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });
    api.sendGetFruitRequest().then((res) {
      setState(() {
        _fruits = res.fruits;
        this.isCallingAPI = false; // ロード状態終了
        statusCode = res.common.statusCode;
      });
    }, onError: (error) {
      debugPrint(error);
      setState(() {
        this.isCallingAPI = false; // ロード状態終了
        statusCode = '---';
      });
    });
  }

  void _callPostApi(String name, int price) {
    var api = new MyAPI();
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });
    api.sendPostFruitRequest(name, price).then((res) {
      setState(() {
        this.isCallingAPI = false; // ロード状態終了
        statusCode = res.common.statusCode;
      });
    }, onError: (error) {
      debugPrint(error);
      setState(() {
        this.isCallingAPI = false; // ロード状態終了
        statusCode = '---';
      });
    });
  }

  void _callPatchApi(String id, int price) {
    var api = new MyAPI();
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });
    api.sendPatchFruitRequest(id, price).then((res) {
      setState(() {
        this.isCallingAPI = false; // ロード状態終了
        statusCode = res.common.statusCode;
      });
    }, onError: (error) {
      debugPrint(error);
      setState(() {
        this.isCallingAPI = false; // ロード状態終了
        statusCode = '---';
      });
    });
  }

  void _callDeleteApi(String id) {
    var api = new MyAPI();
    setState(() {
      _fruits = [];
      this.isCallingAPI = true; // ロード状態開始
      statusCode = '...';
    });
    api.sendDeleteFruitRequest(id).then((res) {
      setState(() {
        this.isCallingAPI = false; // ロード状態終了
        statusCode = res.common.statusCode;
      });
    }, onError: (error) {
      debugPrint(error);
      setState(() {
        this.isCallingAPI = false; // ロード状態終了
        statusCode = '---';
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Fruit App')),
        drawer: MyDrawer(),
        body: Row(children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(width: 400.0),
            child: RequestList(onTapGet: () {
              _callGetApi();
            }, onTapPost: (name, price) {
              _callPostApi(name, int.parse(price));
            }, onTapPatch: (id, price) {
              _callPatchApi(id, int.parse(price));
            }, onTapDelete: (id) {
              _callDeleteApi(id);
            }),
          ),
          Expanded(
              child: Column(children: [
            ResponseBar(
              isLoading: this.isCallingAPI,
              statusCode: this.statusCode,
            ),
            _hasFruits()
                ? MyTable(
                    fruits: this._fruits,
                  )
                : MyEmptyTable()
          ]))
        ]));
  }
}

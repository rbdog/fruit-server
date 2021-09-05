import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import './fruit.dart';

class MyTable extends StatelessWidget {
  List<Fruit> fruits = [];
  var _scrollController = ScrollController();
  MyTable({required this.fruits});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                  width: double.infinity,
                  child: PaginatedDataTable(
                    showCheckboxColumn: false,
                    rowsPerPage: 20,
                    columns: [
                      DataColumn(label: const Text('ID')),
                      DataColumn(label: const Text('名前')),
                      DataColumn(label: const Text('価格')),
                      DataColumn(label: const Text('登録日時')),
                      DataColumn(label: const Text('更新日時')),
                    ],
                    source: MyDataSource(fruits: this.fruits),
                  )),
            )));
  }
}

class MyDataSource extends DataTableSource {
  List<Fruit> fruits;
  MyDataSource({required this.fruits});

  @override
  DataRow getRow(int index) {
    final fruit = this.fruits[index];
    return DataRow(
        // 偶数rowと奇数rowで色を変える
        color: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (index % 2 == 0) return Colors.grey.withOpacity(0.3);
          return Colors.white.withOpacity(0.3);
        }),
        cells: [
          DataCell(Text(fruit.id.toString())),
          DataCell(Text(fruit.name)),
          DataCell(Text(fruit.price.toString())),
          DataCell(Text(DateFormat('yyyy/M/d', "ja_JP")
              .format(fruit.createdAt.toLocal()))),
          DataCell(Text(DateFormat('yyyy/M/d HH:mm:ss', "ja_JP")
              .format(fruit.updatedAt.toLocal())))
        ]);
  }

  @override
  int get rowCount => this.fruits.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => 0;
}

class MyEmptyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(15.0),
            decoration: new BoxDecoration(color: Colors.grey[300]),
            child: new Center(
              child: new Text(
                "No Data",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white),
              ),
            )));
  }
}

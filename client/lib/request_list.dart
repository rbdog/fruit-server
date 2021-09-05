import 'package:flutter/material.dart'; // UIデザインテーマ
import 'package:flutter/services.dart'; // 入力制限など

typedef void OnTapGet();
typedef void OnTapPost(String name, String price);
typedef void OnTapPatch(int id, String price);
typedef void OnTapDelete(int id);

class RequestList extends StatelessWidget {
  final OnTapGet onTapGet;
  final OnTapPost onTapPost;
  final OnTapPatch onTapPatch;
  final OnTapDelete onTapDelete;

  RequestList({
    required this.onTapGet,
    required this.onTapPost,
    required this.onTapPatch,
    required this.onTapDelete,
  });

  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        color: Colors.white70,
      ),
      child: Container(
        color: Colors.grey[850],
        child: ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                // cards provide nice margin
                margin: EdgeInsets.all(20),
                child: GetRequestCell(onTapGet: () {
                  this.onTapGet();
                }),
              );
            } else if (index == 1) {
              return Container(
                  // cards provide nice margin
                  margin: EdgeInsets.all(20),
                  child: PostRequestCell(onTapPost: (name, price) {
                    this.onTapPost(name, price);
                  }));
            } else if (index == 2) {
              return Container(
                  // cards provide nice margin
                  margin: EdgeInsets.all(20),
                  child: PatchRequestCell(onTapPatch: (id, price) {
                    this.onTapPatch(id, price);
                  }));
            } else if (index == 3) {
              return Container(
                  // cards provide nice margin
                  margin: EdgeInsets.all(20),
                  child: DeleteRequestCell(onTapDelete: (id) {
                    this.onTapDelete(id);
                  }));
            } else {
              return Text('Null');
            }
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 2,
            height: 30,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

/// GET
class GetRequestCell extends StatelessWidget {
  final OnTapGet onTapGet;
  GetRequestCell({required this.onTapGet});

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'GET ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: Text('Request'),
              onPressed: () {
                onTapGet();
              },
            ),
          ],
        ),
        Text('/api/fruits'),
        SizedBox(height: 12),
      ],
    );
  }
}

/// POST
class PostRequestCell extends StatelessWidget {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final OnTapPost onTapPost;
  PostRequestCell({required this.onTapPost});

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'POST ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: Text('Request'),
              onPressed: () {
                this.onTapPost(_nameController.text, _priceController.text);
              },
            ),
          ],
        ),
        Text('/api/fruits'),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(flex: 3, child: Text('name:', textAlign: TextAlign.right)),
            SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: TextFormField(
                enabled: true,
                // 入力数
                maxLength: 10,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '10文字まで',
                  labelText: '名前 *',
                  counter: Container(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '入力されていません';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                controller: _nameController,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 3, child: Text('price:', textAlign: TextAlign.right)),
            SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: TextFormField(
                enabled: true,
                // 入力数
                maxLength: 3,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '入力は数字のみ',
                  labelText: '価格 *',
                  counter: Container(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '入力されていません';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                controller: _priceController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// PATCH
class PatchRequestCell extends StatelessWidget {
  final _idController = TextEditingController();
  final _priceController = TextEditingController();
  final OnTapPatch onTapPatch;
  PatchRequestCell({required this.onTapPatch});

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'PATCH ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: Text('Request'),
              onPressed: () {
                this.onTapPatch(
                  int.parse(_idController.text),
                  _priceController.text,
                );
              },
            ),
          ],
        ),
        Text('/api/fruits/{id}'),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(flex: 3, child: Text('ID:', textAlign: TextAlign.right)),
            SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: TextFormField(
                enabled: true,
                // 入力数
                maxLength: 5,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '入力は数字のみ',
                  labelText: 'ID *',
                  counter: Container(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '入力されていません';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                controller: _idController,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 3, child: Text('price:', textAlign: TextAlign.right)),
            SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: TextFormField(
                enabled: true,
                // 入力数
                maxLength: 3,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '入力は数字のみ',
                  labelText: '価格 *',
                  counter: Container(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '入力されていません';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                controller: _priceController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// DELETE
class DeleteRequestCell extends StatelessWidget {
  final _idController = TextEditingController();
  final OnTapDelete onTapDelete;
  DeleteRequestCell({required this.onTapDelete});

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'DELETE ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: Text('Request'),
              onPressed: () {
                this.onTapDelete(int.parse(_idController.text));
              },
            ),
          ],
        ),
        Text('/api/fruits/{id}'),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(flex: 3, child: Text('ID:', textAlign: TextAlign.right)),
            SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: TextFormField(
                enabled: true,
                // 入力数
                maxLength: 3,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '入力は数字のみ',
                  labelText: 'ID *',
                  counter: Container(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '入力されていません';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                controller: _idController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

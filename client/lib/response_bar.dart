import 'package:flutter/material.dart';

class ResponseBar extends StatelessWidget {
  final bool isLoading;
  final String statusCode;
  ResponseBar({required this.isLoading, required this.statusCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            '>>',
            style: TextStyle(
              fontSize: 24,
              color: Colors.green,
            ),
          ),
          Spacer(),
          isLoading
              ? Icon(Icons.refresh, color: Colors.green)
              : Icon(Icons.check_circle_outline, color: Colors.green),
          SizedBox(
            width: 8,
          ),
          Text(
            'Response',
            style: TextStyle(
              fontSize: 24,
              color: Colors.green,
            ),
          ),
          SizedBox(width: 30),
          Text(
            'StatusCode: ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Text(
            statusCode,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}

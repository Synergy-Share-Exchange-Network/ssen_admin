import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestHistory extends StatefulWidget {
  @override
  _RequestHistoryState createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text("request.title"),
        subtitle: Text("request.description"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Declined",
              style: TextStyle(
                color: "Declined" == 'Declined'
                    ? Colors.orange
                    : "request.status" == 'Approved'
                        ? Colors.green
                        : Colors.red,
              ),
            ),
            if ('Declined' == 'Declined') ...[
              SizedBox(width: 10),
              IconButton(
                  icon: Icon(Icons.cancel, color: Colors.red),
                  onPressed: () {}),
            ],
          ],
        ),
      ),
    );
  }
}

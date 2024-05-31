import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssen_admin/Models/company_profile_model.dart';

class RequestHistory extends StatefulWidget {
  final CompanyProfileModel company;

  const RequestHistory({super.key, required this.company});
  @override
  _RequestHistoryState createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(widget.company.name),
        subtitle: Text(widget.company.adminRejection[0]),
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

import 'package:flutter/material.dart';

import '../utils/constants/pop_up_dialog.dart';

class Requestdetail extends StatelessWidget {
  final String requestStatus;
  final String requestDate;
  final String requestDescription;
  final String requesterName;
  final String requesterEmail;
  final String requesterPhoneNumber;
  final String requesterAddress;

  Requestdetail({
    required this.requestStatus,
    required this.requestDate,
    required this.requestDescription,
    required this.requesterName,
    required this.requesterEmail,
    required this.requesterPhoneNumber,
    required this.requesterAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request Status:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(requestStatus),
            SizedBox(height: 20),
            Text(
              'Request Date:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(requestDate),
            SizedBox(height: 20),
            Text(
              'Request Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(requestDescription),
            SizedBox(height: 20),
            Text(
              'Requester Information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Name: $requesterName'),
            Text('Email: $requesterEmail'),
            Text('Phone Number: $requesterPhoneNumber'),
            Text('Address: $requesterAddress'),
            ElevatedButton(
              onPressed: () => showSuccessDialog(context),
              child: Text('Show Success Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
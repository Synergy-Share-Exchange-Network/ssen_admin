import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('asset/demo_image/habesha.png'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Requester Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('requester@example.com'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('123-456-7890'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Date:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('2023-05-18'),
              ],
            ),
            SizedBox(height: 16),
            _buildLicenseSection(
              'Trade Licenses',
              ['asset/demo_image/habesha1.jpg'],
            ),
            SizedBox(height: 16),
            _buildLicenseSection(
              'Share Licenses',
              [
                'asset/demo_image/habesha1.jpg',
                'asset/demo_image/habesha1.jpg',
                'asset/demo_image/habesha1.jpg'
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle accept action
                  },
                  child: Text('Accept'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showDeclineDialog(context);
                  },
                  child: Text('Decline'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLicenseSection(String title, List<String> imagePaths) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imagePaths.map((path) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  path,
                  height: 250,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _showDeclineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Decline Request'),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Enter reason for decline',
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle decline action with reason
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

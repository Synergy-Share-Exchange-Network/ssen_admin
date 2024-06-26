import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_admin/Models/company_profile_model.dart';
import 'package:ssen_admin/Models/user_model.dart';
import 'package:ssen_admin/Repository/firebase/model%20methods/firebase_update_methods.dart';
import 'package:ssen_admin/utils/utils.dart';

import '../provider/admin_provider.dart';
import '../services/theme/text_theme.dart';

class RequestDetailPage extends StatefulWidget {
  final CompanyProfileModel company;

  const RequestDetailPage({super.key, required this.company});

  @override
  State<RequestDetailPage> createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage> {
  Future<void> acceptRequest(UserModel user, String id) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Container(
          padding: EdgeInsets.all(20),
          height: 125,
          child: Column(
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text("Accepting Request..."),
            ],
          ),
        ),
      ),
    );
    await FirebaseUpdateMethodUser().update(user, id, "Confirm Company is true",
        'isVerified', true, CompanyProfileModel);
    // await Provider.of<UserProvider>(context, listen: false).refreshUser();
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void declineRequest(UserModel user, String id) {
    TextEditingController reasonController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Decline Request'),
          content: TextField(
            controller: reasonController,
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
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    content: Container(
                      padding: EdgeInsets.all(20),
                      height: 125,
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Declining Request..."),
                        ],
                      ),
                    ),
                  ),
                );
                await FirebaseUpdateMethodUser().update(
                    user,
                    id,
                    reasonController.text.trim(),
                    'adminRejection',
                    [
                      'false',
                      reasonController.text.trim(),
                      DateTime.now().toString()
                    ],
                    CompanyProfileModel);
                // await Provider.of<UserProvider>(context, listen: false).refreshUser();
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = UserModel(
        firstName: 'firstName',
        lastName: 'lastName',
        phoneNumber: 'phoneNumber',
        identification: 'ide');
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(getImage(widget.company.logoImage[0])),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.company.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.company.email),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.company.phoneNumber),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Date:  ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.company.createdDay),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Trade Lisense",
                    style: STextTheme.lightTextTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    getImage(widget.company.tradeLicense[0]),
                    height: 250,
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Share Lisense",
                            style: STextTheme.lightTextTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        getImage(widget.company.shareSalesLicense[0]),
                        height: 250,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        acceptRequest(user, widget.company.identification);
                      },
                      child: Text('Accept'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        declineRequest(user, widget.company.identification);
                      },
                      child: Text('Decline'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

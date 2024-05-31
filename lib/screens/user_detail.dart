import 'package:flutter/material.dart';
import 'package:ssen_admin/Models/user_model.dart';
import 'package:ssen_admin/utils/constants.dart';

class UserDetail extends StatelessWidget {
  UserModel user = UserModel(
      profilePicture: ["asset/logo_image/goat.jpg"],
      firstName: "Dawit Nigus",
      lastName: "lastName",
      phoneNumber: "+25197352738",
      region: "oromia/west region",
      birthDate: "22/03/1996",
      email: "dawitnigus@gmail.com",
      kebeleIDPhoto: ["asset/logo_image/goat.jpg", "asset/logo_image/goat.jpg"],
      gender: "male",
      address: ["hawassa ethiopia"],
      isEnabled: true,
      isBanned: false,
      isDeleted: true);
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        // body: SingleChildScrollView(
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        //     child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        //   ),
        // ),
        body: MediaQuery.of(context).size.width > phoneSize
            ? SingleChildScrollView(
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        CircleAvatar(
                          radius: 85,
                          backgroundImage: AssetImage(user.profilePicture[0]),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          user.firstName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          user.address[0],
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPersonalInfo(),
                        const SizedBox(height: 15),
                        Divider(),
                        const SizedBox(height: 15),
                        _buildCredentialInfo(),
                        const SizedBox(height: 18),
                        Divider(),
                        const SizedBox(height: 18),
                        _buildOperations(),
                        const SizedBox(height: 18),
                        Divider(),
                        const SizedBox(height: 18),
                        _buildContactInfo(),
                      ],
                    ),
                  ),
                ],
              ))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    CircleAvatar(
                      radius: 85,
                      backgroundImage: AssetImage(user.profilePicture[0]),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.firstName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.address[0],
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    _buildPersonalInfo(),
                    const SizedBox(height: 15),
                    Divider(),
                    const SizedBox(height: 15),
                    _buildCredentialInfo(),
                    const SizedBox(height: 18),
                    Divider(),
                    const SizedBox(height: 18),
                    _buildOperations(),
                    const SizedBox(height: 18),
                    Divider(),
                    const SizedBox(height: 18),
                    _buildContactInfo(),
                  ],
                ),
              ));
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 85,
          backgroundImage: AssetImage(user.profilePicture[0]),
        ),
        const SizedBox(height: 10),
        Text(
          user.firstName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        const SizedBox(height: 5),
        Text(
          user.address[0],
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        _buildPersonalInfo(),
        const SizedBox(height: 15),
        Divider(),
        const SizedBox(height: 15),
        _buildCredentialInfo(),
        const SizedBox(height: 18),
        Divider(),
        const SizedBox(height: 18),
        _buildOperations(),
        const SizedBox(height: 18),
        Divider(),
        const SizedBox(height: 18),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 85,
                backgroundImage: AssetImage(user.profilePicture[0]),
              ),
              const SizedBox(height: 10),
              Text(
                user.firstName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              const SizedBox(height: 5),
              Text(
                user.address[0],
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPersonalInfo(),
              const SizedBox(height: 15),
              Divider(),
              const SizedBox(height: 15),
              _buildCredentialInfo(),
              const SizedBox(height: 18),
              Divider(),
              const SizedBox(height: 18),
              _buildOperations(),
              const SizedBox(height: 18),
              Divider(),
              const SizedBox(height: 18),
              _buildContactInfo(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        _buildInfoRow('Gender', user.gender),
        const SizedBox(height: 18),
        _buildInfoRow('Region/Woreda', user.region),
        const SizedBox(height: 18),
        _buildInfoRow('Number of Share Hold', '300'),
        const SizedBox(height: 18),
        _buildInfoRow('Date of Birth', user.birthDate),
        const SizedBox(height: 18),
        _buildInfoRow('Registration Date', '20/12/2004'),
      ],
    );
  }

  Widget _buildCredentialInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Credential Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        _buildImageRow(
            'Identification', user.kebeleIDPhoto[0], user.kebeleIDPhoto[1]),
      ],
    );
  }

  Widget _buildOperations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Operations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        _buildOperationRow('Enabled', 'true', Colors.green, Colors.red),
        const SizedBox(height: 18),
        _buildOperationRow('Delete', 'false', Colors.red, Colors.red),
        const SizedBox(height: 18),
        _buildOperationRow('Ban', 'true', Colors.green, Colors.red),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        _buildContactRow(Icons.call, user.phoneNumber),
        const SizedBox(height: 18),
        _buildContactRow(Icons.email, user.email),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          value,
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildImageRow(String label, String imageUrl1, String imageUrl2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 150,
          height: 100,
          color: Colors.blue,
          child: Image.asset(
            imageUrl1,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 150,
          height: 100,
          color: Colors.blue,
          child: Image.asset(
            imageUrl2,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget _buildOperationRow(
      String label, String value, Color enableColor, Color disableColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(width: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle enable button press
              },
              style: ElevatedButton.styleFrom(primary: enableColor),
              child: Text('Enable'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                // Handle disable button press
              },
              style: ElevatedButton.styleFrom(primary: disableColor),
              child: Text('Disable'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 18,
        ),
        const SizedBox(width: 15),
        Text(
          value,
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ],
    );
  }
}

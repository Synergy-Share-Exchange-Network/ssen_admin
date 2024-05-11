import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/theme/text_theme.dart';
import '../utils/constants.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/navbar.dart';
import '../utils/helper_function.dart';

class CompanyDetail extends StatelessWidget {
  const CompanyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
        drawer: MediaQuery.of(context).size.width > phoneSize ? NavBar() : null,
        appBar: AppBar(
          leading: MediaQuery.of(context).size.width >
                  600 // Check screen width for desktop layout
              ? null // Render NavBar for desktop
              : IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
          elevation: 0,
          title: Text(
            'User Detail',
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
        ),
        body: MediaQuery.of(context).size.width < phoneSize
            ? SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        child: const CircleAvatar(
                          radius: 85,
                          backgroundImage:
                              AssetImage('asset/logo_image/goat.jpg'),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        child: const Text(
                          "Dawit nigus ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        child: const Text(
                          "Hawassa, Ethiopia ",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 170,
                            child: const Text(
                              "share Company",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: const Text(
                              "habesha breweries",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 130,
                            child: const Text(
                              "number of share to sell",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: const Text(
                              "400 shares",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 130,
                            child: const Text(
                              "unit share price",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: const Text(
                              "100 birr",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 130,
                            child: const Text(
                              "number of share to sell",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: const Text(
                              "400 shares",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.call,
                            color: Colors.black,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: const Text(
                              "+2519-4203-0866",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.card_giftcard,
                            color: Colors.black,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: const Text(
                              "dawitnigus45@gmail.com",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side containing photo, name, and location
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.start, // Align items to the top
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10), // Adjust top spacing
                            Container(
                              child: const CircleAvatar(
                                radius: 85,
                                backgroundImage:
                                    AssetImage('asset/logo_image/goat.jpg'),
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Adjust spacing between photo and name
                            Container(
                              child: const Text(
                                "Habesha Beer ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 27),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              child: const Text(
                                "Hawassa, Ethiopia ",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(height: 20), 
                            ElevatedButton(onPressed: (){}, child: const Text('View Profile'))
                          ],
                        ),
                      ),
                      // Right side containing share company, share number, etc.
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal information ',
                              style: dark
                                  ? STextTheme.darkTextTheme.bodySmall
                                  : STextTheme.lightTextTheme.bodySmall,
                            ),
                            Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Gender",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Male",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Region/woreda",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Oromia/East shewa",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "number of share hold",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "300",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Date of Birth",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "20/20/2001",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Registration date",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "20/12/2004",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Divider(),
                            const SizedBox(height: 15),
                            Text(
                              'Crediation informations',
                              style: dark
                                  ? STextTheme.darkTextTheme.bodySmall
                                  : STextTheme.lightTextTheme.bodySmall,
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "identification ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Container(
                                  width: 300, // width of the rectangle
                                  height: 200, // height of the rectangle
                                  color: Colors.blue, // color of the rectangle
                                  child: Image.asset(
                                    'asset/logo_image/goat.jpg', // URL of your image
                                    fit: BoxFit
                                        .fill, // Adjust the image fit within the rectangle
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Container(
                                  width: 300, // width of the rectangle
                                  height: 200, // height of the rectangle
                                  color: Colors.blue, // color of the rectangle
                                  child: Image.asset(
                                    'asset/logo_image/goat.jpg', // URL of your image
                                    fit: BoxFit
                                        .fill, // Adjust the image fit within the rectangle
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Divider(),
                            const SizedBox(height: 18),
                            Text(
                              'Operations',
                              style: dark
                                  ? STextTheme.darkTextTheme.bodySmall
                                  : STextTheme.lightTextTheme.bodySmall,
                            ),
                             const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Enabled(true)",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle 'Yes' button press
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
                                            .green, // Green color for 'Yes' button
                                      ),
                                      child: Text('Enable'),
                                    ),
                                    SizedBox(
                                        width: 20), // Add space between buttons
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle 'No' button press
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
                                            .red, // Red color for 'No' button
                                      ),
                                      child: Text('Disable'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                             const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "delete(false)",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     // Add space between buttons
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle 'No' button press
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
                                            .red, // Red color for 'No' button
                                      ),
                                      child: Text('Delete'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                             const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Ban(true)",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle 'Yes' button press
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
                                            .green, // Green color for 'Yes' button
                                      ),
                                      child: Text('Enable'),
                                    ),
                                    SizedBox(
                                        width: 20), // Add space between buttons
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle 'No' button press
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
                                            .red, // Red color for 'No' button
                                      ),
                                      child: Text('Disable'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Registration date",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "20/12/2004",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Contact",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.call,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "+2519-4203-0866",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.card_giftcard,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "dawitnigus45@gmail.com",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}

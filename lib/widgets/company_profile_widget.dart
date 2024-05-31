import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_admin/Models/company_profile_model.dart';

import '../../services/theme/text_theme.dart';

import '../screens/company_detail.dart';
import '../screens/user_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({Key? key, required this.company}) : super(key: key);
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CompanyDetail()), // Replace ShareholderDetailPage() with your actual detail page
          );
        },
        child: Container(
          // height: 100,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.4),
              borderRadius: BorderRadius.all(Radius.circular(7))),
          // color: Colors.pink,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_city,
                            // color: Colors.black,
                            size: 12,
                          ),
                          Text(company.locationDescription,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            // Iconsax.clock,
                            Icons.lock_clock,
                            color: Colors.grey,
                            size: 10,
                          ),
                          Text(
                            "Dec01/2023",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Iconsax {}

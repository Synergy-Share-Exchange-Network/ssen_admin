import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_admin/Models/ML%20models/ML_general_attribute_model.dart';
import 'package:ssen_admin/widgets/company_profile_widget.dart';
import 'package:ssen_admin/widgets/ml_attribute_element_widget.dart';

class MLAttribute extends StatelessWidget {
  MLGeneralAttributeModel mlattribute = MLGeneralAttributeModel(
    politicalStablity: 3.7,
    unemploymentRate: 2.4,
    GDP: 1.4,
    inflation: 3.2,
    globalEconomy: 1.8,
    famines: 4.1,
    naturalDisaster: 1.3,
    rumoursOnShareMarket: 3.3,
  );
  MLAttribute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 176, 217, 252)),
              child: const Text(
                "General Attributes",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const MLAttributeElements(
                      title: "Political Stability : ",
                      label: "label",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MLAttributeElements(
                      title: "Unemployment rate",
                      label: "label",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MLAttributeElements(
                      title: "Gross Domestic Product(GDP)",
                      label: "label",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MLAttributeElements(
                      title: "Inflation",
                      label: "label",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MLAttributeElements(
                      title: "Global Economy",
                      label: "label",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MLAttributeElements(
                      title: "Famines",
                      label: "label",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MLAttributeElements(
                      title: "Natural Disaster",
                      label: "label",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MLAttributeElements(
                      title: "Rumers On Share MarketS",
                      label: "label",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text("Discard",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                SizedBox(
                  width: 150,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(3)),
                  child: Text("Save",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../theme/appTheme.dart';
import '../../../theme/customTextStyles.dart';
import '../../../widgets/customElevatedButton.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need react devloper with Experience in State menagement tools in Js",
            style: CustomTextStyles.bodyLargeBlack,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Posted : 2 hours ago",
            ),
          ),
          const Text(
              textAlign: TextAlign.justify,
              """Need a proper experienced developer with good knowlende in mechine learning and data scienc of pro Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        """),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Price",
              style: theme.textTheme.titleSmall,
            ),
          ),
          Text(
            "\$1200 - \$1500  |  Expert  | 7 days",
            style: CustomTextStyles.bodySmallBluegray900,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          Text(
            "Skills Required",
            style: theme.textTheme.titleSmall,
          ),
          Row(
            children: [
              Chip(
                side: BorderSide.none,
                backgroundColor: themeColors.indigo100,
                label: const Text(
                  "node.js",
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              const SizedBox(
                width: 8,
              ),
              Chip(
                side: BorderSide.none,
                backgroundColor: themeColors.indigo50,
                label: const Text(
                  "Mongo",
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Client Details",
              style: theme.textTheme.titleSmall,
            ),
          ),
          const Text(
            "[Payment Verified] \n[Rating : 4.3 by 10] \n[spent : \$30,000]",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Proposals : 2",
                style: CustomTextStyles.bodySmallBluegray900,
              ),
              Text(
                "Bid Coins : 3 ",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top : 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  alignment: Alignment.topLeft,
                  height: 30,
                  width: 120,
                  text: "Close",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  buttonStyle: ElevatedButton.styleFrom(
                    primary: Colors.grey, // Set the background color to grey
                    onPrimary: Colors.white, // Set the text color to white
                  ),),
                CustomElevatedButton(
                  height: 30,
                  width: 120,
                  text: "Bid",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

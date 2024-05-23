import 'package:flutter/material.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';

class HeaderWeb extends StatelessWidget {
  const HeaderWeb({super.key});
  @override
  AppBar build(BuildContext context) {
    return AppBar(
          title: Expanded(child: Text('OneLancer')),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Home",
                  style: CustomTextStyles.titleSmallSemiBold,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Projects",
                  style: CustomTextStyles.titleSmallSemiBold,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "About Us",
                  style: CustomTextStyles.titleSmallSemiBold,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Contact",
                  style: CustomTextStyles.titleSmallSemiBold,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Contribute",
                  style: CustomTextStyles.titleSmallSemiBold,
                )),
            SizedBox(width: 20),
            CustomElevatedButton(
              width: 100,
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              text: 'Login',
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
            ),
            SizedBox(width: 10),
            CustomElevatedButton(
              width: 100,
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
              text: "Join",
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
            ),
            SizedBox(width: 20),
          ],
        );
  }
}
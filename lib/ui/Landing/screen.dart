import 'package:flutter/material.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';
import 'package:onelancer_flutter/widgets/headerWeb.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: const HeaderWeb(),
        ),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.45),
                  child: RichText(
                    text: const TextSpan(
                      text: "The Ultimate Platform for ",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Freelancers ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: "\nAnd a Quality Service for ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Clients",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.45),
                  child: Image.asset('assets/images/landing_1.png'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Column(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "What Unique ",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "About Us?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TransparentCard(
                                title: "Simple and minimalist",
                                body:
                                    "We believe in simplicity and minimalism in our work. We strive to create clean and elegant solutions for our clients.",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TransparentCard(
                                title: "No hidden charges",
                                body:
                                    "Transparency is our core value. We believe in providing upfront pricing and ensuring there are no hidden charges for our clients.",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TransparentCard(
                                title: "We are Freelancers too",
                                body:
                                    "We understand the challenges and opportunities of being a freelancer. That's why we are dedicated to supporting and empowering freelancers.",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Join us today and experience the difference",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: "Join Now",
                    width: 200,
                    buttonTextStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 23, 30, 38),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OneLancer",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      Text(
                        "© 2021 OneLancer. All rights reserved.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
          ],
        ));
  }
}

class TransparentCard extends StatelessWidget {
  final String title;
  final String body;

  TransparentCard({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

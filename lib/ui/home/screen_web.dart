import 'package:flutter/material.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(child: Text('OneLancer')),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Projects",
                style: CustomTextStyles.titleSmallSemiBold,
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "MyWork",
                style: CustomTextStyles.titleSmallSemiBold,
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "Contribute*",
                style: CustomTextStyles.titleSmallSemiBold,
              )),
          SizedBox(width: 20),
          IconButton(onPressed: () {}, icon: Icon(Icons.help)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          SizedBox(width: 20),
        ],
      ),
      body: Filters(),
    );
  }

  Container Filters() {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Filtered By",
            style: TextStyle(fontSize: 32, color: Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),

          //Experience level
          Text("Experience level"),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {
                  // TODO: Handle checkbox state change
                },
              ),
              Text("Beginner")
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {
                  // TODO: Handle checkbox state change
                },
              ),
              Text("Intermediate")
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {
                  // TODO: Handle checkbox state change
                },
              ),
              Text("Advanced")
            ],
          ),
          const SizedBox(height: 16),
          // Job type
          Text("Job type"),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Fixed Price")
            ],
          ),
          //PRICES RANGE
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Less than 500")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("500 - 1000")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("1000 - 5000")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("5000 - 10000")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("More than 10000")
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Hourly")
            ],
          ),
          //PRICES RANGE
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Less than 10")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("10 - 30")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("30 - 60")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("60 - 100")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("More than 100")
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Job category
          Text("Job category"),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Web Development")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Mobile Development")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Design")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Writing")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Marketing")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Engineering")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Data Science")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Sales")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Customer Service")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Business")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Others")
            ],
          ),
          const SizedBox(height: 16),
          // Job duration
          Text("Job duration"),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("Less than a week")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("1 - 4 weeks")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("1 - 3 months")
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("More than 3 months")
            ],
          ),
          const SizedBox(height: 16),
          // Actions
          Row(
            children: [
              CustomElevatedButton(
                onPressed: () {},
                text: "Clear",
                width: 100,
                buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
              ),
              SizedBox(width: 10),
              CustomElevatedButton(
                onPressed: () {},
                text: "Apply",
                width: 100,
                buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
              ),
            ],
          ),
        ]));
  }
}

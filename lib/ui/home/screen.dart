import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/controllers/chat_controller.dart';
import 'package:onelancer_flutter/controllers/job_controller.dart';
import 'package:onelancer_flutter/controllers/proposal_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/ui/Proposal/Proposals.dart';
import 'package:onelancer_flutter/ui/home/widgets/expandedDialog.dart';
import 'package:onelancer_flutter/ui/message/screen.dart';
import 'package:onelancer_flutter/ui/uploadJob/jobs.dart';
import 'package:onelancer_flutter/ui/uploadJob/screen.dart';
import 'package:onelancer_flutter/widgets/JobDetailsCard.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/customTextFormField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  JobController jobController = Get.put(JobController());
  ChatController chatController = Get.put(ChatController());
  ProposalController proposalController = Get.put(ProposalController());


  int _selectedPageIndex = 0;
  bool showClientView = false;
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Open Freelancer"),
        actions: [
          Text(showClientView? "Client" : "Freelancer"),
          Transform.scale(
            scale: 0.6,
            child: Switch(
                value: showClientView,
                activeColor: Colors.green,
                onChanged: (bool v) {
                  setState(() {
                    _selectedPageIndex = 0;
                    showClientView = v;
                  });
                }),
          ),
        ],
        elevation: 1,
      ),
      drawer: _buildDrawer(),
      floatingActionButton: showClientView? FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed("/upload_job");
      }, child: Icon(Icons.add, color: Colors.white,),) : null,
      body: _getPage(_selectedPageIndex, showClientView),
      bottomNavigationBar: _buildBottomNavigationBar( showClientView),
    );
  }

  Drawer _buildDrawer() {
    final drawerOptions = [
      "Profile",
      "Transactions",
      "Settings",
      "Help & Support",
      "Logout"
    ];
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50, left: 8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Anji Reddy Modugula",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        "<Software developer>",
                        style: theme.textTheme.bodySmall,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        if(drawerOptions[index] == "Logout"){
                          authController.logout();
                        }
                      },
                      title: Text(
                        drawerOptions[index],
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: themeColors.gray400,
                      ),
                    ), // Add a Divider after each ListTile
                  ],
                );
              },
              itemCount: drawerOptions.length,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(showClientView) {
    return BottomNavigationBar(
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      items: showClientView ? const [
        BottomNavigationBarItem(icon: Icon(Icons.work_history), label: "Jobs"),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "messages")
      ] : const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Jobs"),
        BottomNavigationBarItem(icon: Icon(Icons.tab), label: "Proposals"),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "messages")
      ],
      currentIndex: _selectedPageIndex,
      onTap: (index) => {
        setState(() {
          _selectedPageIndex = index;
        })
      },
    );
  }

  Widget _buildHomeFeed() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "React | Python",
            textInputType: TextInputType.text,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            borderDecoration: TextFormFieldStyleHelper.fillIndigo,
            fillColor: themeColors.indigo50,
            autofocus: false,
            suffix: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Results : react",
                      style: theme.textTheme.bodyMedium,
                    )),
                GestureDetector(
                    onTap: () {
                      _showFilterBottomSheet(context);
                    },
                    child: const Icon(Icons.tune))
              ],
            ),
          ),_buildProjectsList(), 
        ],
      ),
    );
  }

  Widget _getPage(index, showClientView) {
    if (showClientView) {
      return switch (index) {
        0 => Jobs(),
        1 => const Messages(),
        _ => const Center(child: Text("comming soom")),
      };
    } else {
      return switch (index) {
        0 => _buildHomeFeed(),
        1 => const Proposals(),
        2 => const Messages(),
        _ => const Center(child: Text("comming soom")),
      };
    }
  }

  Expanded _buildProjectsList() {
    return Expanded(
      child: Obx(() =>
      ListView.builder(
        itemCount: jobController.homeFeed.length,
        itemBuilder: (BuildContext context, int index) {
          return JobDetails(jobDetails: jobController.homeFeed[index]);
        },

      )
    ));
  }

  void showExpandableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ExpandableDialog();
      },
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Filters()
          // Container(
          //   padding: EdgeInsets.all(16),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('Filter Options', style: theme.textTheme.titleLarge),
          //       SizedBox(height: 20),
          //       _buildDropdown(
          //           "Experience :", ["Entry", "Intermediate", "Expert"]),
          //       _buildPriceRangeDropdown("Price Range :"),
          //       _buildDropdown("Currency :", ["INR"]),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    String selectedOption = options.first;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        DropdownButton<String>(
          value: selectedOption,
          onChanged: (String? value) {
            if (value != null) {
              selectedOption = value;
            }
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPriceRangeDropdown(String label) {
    String minPrice = "1000";
    String maxPrice = "50000";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  hintText: minPrice,
                  textInputType: TextInputType.number,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  // borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                  autofocus: false),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomTextFormField(
                  hintText: maxPrice,
                  textInputType: TextInputType.number,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  // borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                  autofocus: false),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
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
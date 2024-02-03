import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/ui/message/screen.dart';
import 'package:onelancer_flutter/ui/uploadJob/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController authController = Get.find();

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OpenFreelancer"),
        actions: [
          IconButton(onPressed: () async { 
              authController.logout();
           },
          icon: Icon(Icons.logout)),
        ],
      ),
      drawer: _buildDrawer(),
      body: _getPage(_selectedPageIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              
            },
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
            },
            title: const Text('Settings')
          )
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_document), label: "Uplaod"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "Proposals"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: "messages")
        ],
        currentIndex: _selectedPageIndex,
        onTap: (index) => {
          setState(() {
            _selectedPageIndex = index;
          })
          
        },
        );
  }

  Column _buildHomeFeed() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search by keyword",
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // Add your functionality here when the button is pressed.
          },
          child: const Text("Add Filters"),
        ),
        _buildProjectsList(),
      ],
    );
  }

  Widget _getPage(index){
    return switch (index) {
      0 => _buildHomeFeed(),
      1 => const UploadProject(),
      3 => const Messages(),
      _ => const Center(
        child : Text("comming soom")
      ),
  };
  }

  Expanded _buildProjectsList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("posted 9 mins ago"),
                const Row(
                  children: [
                    Text("Project title b jsbv j vlldfjv kjv ldvldkjvkj bv"),
                    Spacer(),
                    Icon(Icons.favorite),
                  ],
                ),
                const Text("Price Details "),
                const Text("Project description jsfvlkfjdblv jv  eg egeg"),
                TextButton(
                  onPressed: () {
                    // Add your functionality here when the button is pressed.
                  },
                  child: const Text("+more"),
                ),
                const Row(
                  children: [
                    Chip(label: Text("node.js")),
                    Chip(label: Text("ReactJS")),
                  ],
                ),
                const Text("Proposals : less than 10"),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';

class Proposals extends StatefulWidget {
  const Proposals({super.key});

  @override
  State<Proposals> createState() => _ProposalsState();
}

class _ProposalsState extends State<Proposals>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(16),
          child: Text("Proposals", style: theme.textTheme.headlineMedium,),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: "Submitted",
                ),
                Tab(
                  text: "In Progress",
                ),
                Tab(
                  text: "Past",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              _buildTabView(context),
              _buildTabView(context),
              _buildTabView(context),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildTabView(context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ExpansionTile(
          collapsedBackgroundColor : Colors.white,
          title: Text(
            "Need Expert React developer to work on state management.",
            style: theme.textTheme.titleSmall,
          ),
          subtitle: Text(
            "Submited : 10 hours ago",
            style: theme.textTheme.bodyMedium,
          ),
          children: [
            Container(
              color: themeColors.indigo50,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bid Amount"),
                      Text("\$1300"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Proposed Timeline"),
                      Text("7 days"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: "Edit",
                    height: 30,
                  )
                ],
              ),
            )
          ],
        );
      },
      itemCount: 5,
    );
  }
}

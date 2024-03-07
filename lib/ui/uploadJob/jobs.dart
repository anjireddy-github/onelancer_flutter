import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/job_controller.dart';
import 'package:onelancer_flutter/model/job.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> with SingleTickerProviderStateMixin {
  JobController jobController = Get.find();
  final List<String> statuses = [
    'draft',
    'published',
    'interview',
    'contracted'
  ];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: statuses
              .map((status) => Tab(text: status.toUpperCase()))
              .toList(),
          controller: _tabController,
        ),
        Obx(() => jobController.isLoading.value
            ? Expanded(
                child: Container(
                    color: Colors.black.withOpacity(0.2),
                    child: Center(
                      child: CircularProgressIndicator(),
                    )))
            : Expanded(
                child: TabBarView(controller: _tabController, children: [
                  _buildJobsView(context, statuses[0]),
                  _buildJobsView(context, statuses[1]),
                  _buildJobsView(context, statuses[2]),
                  _buildJobsView(context, statuses[3]),
                ]),
              )),
      ],
    );
  }

  Widget _buildJobsView(BuildContext context, String status) {

    return Obx(() {
      List<JobResponse> filteredJobs = jobController.myJobs
          .where((job) => job.status == status)
          .toList();

      return ListView.separated(
          itemCount: filteredJobs.length,
          itemBuilder: (context, index) {
            final job = filteredJobs[index];
            return buildJobTile(job);
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider();
      },);
    });
  }
  // Function to build ListTile for each job
  Widget buildJobTile(JobResponse job) {
    return ExpansionTile(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(job.title, style: theme.textTheme.displaySmall,)),
          Text("${job.priceDetails.value} : INR", style: theme.textTheme.titleSmall,),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("${job.expectedDuration.days} days - ${job.experienceTitle}", style: theme.textTheme.bodySmall)),
          if (job.status == "draft") IconButton(onPressed: () {}, icon: Icon(Icons.publish))
        ],
      ),
      children: [
        Container(
            color: themeColors.indigo50,
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Text(job.data, style: theme.textTheme.bodySmall,textAlign: TextAlign.justify,)),
      ],
    );
  }
}

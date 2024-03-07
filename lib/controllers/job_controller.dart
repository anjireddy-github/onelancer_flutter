import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:onelancer_flutter/api/job.dart';
import 'package:onelancer_flutter/model/job.dart';

class JobController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController experienceTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  var isLoading = true.obs;
  var errorText = "".obs;

  RxList<JobResponse> myJobs = <JobResponse>[].obs;
  RxList<JobResponse> homeFeed = <JobResponse>[].obs;

  JobResponse? selectedJob;

  @override
  void onInit() {
    super.onInit();
    getMyJobs();
    getHomeFeed();
  }

  Future<void> postJob() async {
    isLoading(true);
    try {
      //creating request body
      var newJob = CreateJobRequest(
          title: titleController.text,
          experienceTitle: experienceTitleController.text,
          description: descriptionController.text,
          priceDetails:
              PriceDetails(type: "Fixed", value: priceController.text),
          currency: "INR",
          expectedDuration: ExpectedDuration(days: daysController.text),
          status: "published");
      var response = await JobApiClient.createJob(newJob);

      await getMyJobs();
      isLoading(false);
      Get.back();
    } catch (e) {
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {
      isLoading(false);
    }
  }

  Future<void> draftJob() async {
    isLoading(true);
    try {
      //creating request body
      var newJob = CreateJobRequest(
          title: titleController.text,
          experienceTitle: experienceTitleController.text,
          description: descriptionController.text,
          priceDetails:
              PriceDetails(type: "Fixed", value: priceController.text),
          currency: "INR",
          expectedDuration: ExpectedDuration(days: daysController.text),
          status: "draft");
      var response = await JobApiClient.createJob(newJob);

      await getMyJobs();
      isLoading(false);
      Get.back();
    } catch (e) {
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getMyJobs() async {
    isLoading(true);
    try {
      var response = await JobApiClient.getMyJobs();
      List<JobResponse> jobList =
          []; // Create a list to store mapped JobResponse objects
      // Iterate through response.data and map each item to a JobResponse object
      for (var item in response.data) {
        jobList.add(JobResponse.fromJson(item));
      }
      myJobs.value = jobList; // Assign the mapped list to myJobs.value

      isLoading(false);
    } catch (e) {
      if (e is DioException) {
        errorText(e.response?.data["msg"]);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> getHomeFeed() async {
    isLoading(true);
    try {
      var response = await JobApiClient.getHomeFeed();
      List<JobResponse> jobList = [];
      // Create a list to store mapped JobResponse objects
      // Iterate through response.data and map each item to a JobResponse object
      for (var item in response.data) {
        jobList.add(JobResponse.fromJson(item));
      }
      homeFeed.value = jobList; // Assign the mapped list to myJobs.value
      isLoading(false);
    } catch (e) {
      if (e is DioException) {
        errorText(e.response?.data["msg"]);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> openWriteProposal(JobResponse job) async{
    selectedJob = job;
    Get.toNamed("/writeProposal");
  }
}

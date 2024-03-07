import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onelancer_flutter/api/proposal.dart';
import 'package:onelancer_flutter/controllers/job_controller.dart';
import 'package:onelancer_flutter/model/proposal.dart';

class ProposalController extends GetxController {
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController coinsController = TextEditingController();

  RxList<ProposalResponse> myProposlas = <ProposalResponse>[].obs;

  var isLoading = false.obs;
  var errorText = "".obs;

  Future<void> submitProposal() async {
    JobController jobController = Get.find();
    isLoading(true);
    try {
      var proposal = CreateProposalRequest(
          jobId: jobController.selectedJob?.id ?? "",
          coverLetter: detailController.text,
          price: double.parse(priceController.text));
      var response = await ProposalApiClient.submitProposal(proposal);

      //clearing fields
      priceController.text = "";
      detailController.text = "";
      daysController.text = "";
      coinsController.text = "";
      isLoading(false);

      // going back to job page
      Get.back();
    } catch (e) {
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getMyProposals() async {
    JobController jobController = Get.find();
    isLoading(true);
    try {
      var response = await ProposalApiClient.getAllProposals();
      List<ProposalResponse> list = [];
      for (var p in response.data) {
        list.add(ProposalResponse.fromJson(p));
      }

      myProposlas.value = list;

      isLoading(false);


    } catch (e) {
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {
      isLoading(false);
    }
  }
}

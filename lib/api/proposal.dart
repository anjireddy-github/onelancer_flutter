
import 'package:dio/dio.dart' as dio;
import 'package:onelancer_flutter/api/apiClient.dart';
import 'package:onelancer_flutter/model/proposal.dart';
class ProposalApiClient {
  static Future<dio.Response> submitProposal(CreateProposalRequest data) async {
    final response = await apiClient.post("/proposals", data: data);
    return response;
  }

  static Future<dio.Response> getAllProposals() async {
    final response = await apiClient.get("/proposals");
    return response;
  }
}
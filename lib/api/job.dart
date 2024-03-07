

import 'package:dio/dio.dart' as dio;
import 'package:onelancer_flutter/model/job.dart';

import 'apiClient.dart';

class JobApiClient {
  static Future<dio.Response> createJob(CreateJobRequest data) async {
    final response = await apiClient.post("/jobs", data: data);
    return response;
  }

  static Future<dio.Response> getMyJobs() async {
    final response = await apiClient.get("/jobs/my_jobs");
    return response;
  }

  static Future<dio.Response> getHomeFeed() async {
    final response = await apiClient.get("/jobs/home_feed");
    return response;
  }
}
import 'package:dio/dio.dart' as dio;

import '../model/chat.dart';
import 'apiClient.dart';

class ChatApiClient {
  static Future<dio.Response> getChatRooms() async {
    final response = await apiClient.get("/chat");
    return response;
  }

  static Future<dio.Response> getAvailableUsers() async {
    final response = await apiClient.get("/chat/available");
    return response;
  }

  static Future<dio.Response> createChatRoom(String userId) async {
    final response = await apiClient.post("/chat/c/$userId");
    return response;
  }

  static Future<dio.Response> getChat(String chatId) async {
    final response = await apiClient.get("/chat/$chatId");
    return response;
  }

  static Future<dio.Response> getAllMessages(String chatId) async {
    final response = await apiClient.get("/chat/msg/$chatId");
    return response;
  }

  static Future<dio.Response> sendMessage(String chatId, SendMessageRequest data) async {
    final response = await apiClient.post("/chat/msg/$chatId", data: data);
    return response;
  }
}
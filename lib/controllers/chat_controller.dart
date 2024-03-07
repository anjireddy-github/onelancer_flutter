import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/api/chat.dart';
import 'package:onelancer_flutter/constants.dart';
import 'package:onelancer_flutter/model/chat.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../api/store.dart';

class ChatController extends GetxController {
  // RxList<ChatRoom> chatRooms = <ChatRoom>[].obs;
  RxMap<String, ChatRoom> chatRooms = <String,ChatRoom>{}.obs;
  RxList<Message> currentRoomMessages = <Message>[].obs;
  Map<String, List<Message>> allMessages = {};
  late ChatRoom currentChatRoom;
  TextEditingController messageController = TextEditingController();

  var isLoading = true.obs;
  var errorText = "".obs;

  void socketInitializer() async {
    var authToken = await Store.getAuthToken();
    final socket = io.io('https://7bkmgv7x-8080.inc1.devtunnels.ms', <String, dynamic>{
      'transports': ['websocket'], // Specify transports (websocket)
      'extraHeaders': {'Authorization': '$authToken'},
      'auth': {
        'token': '$authToken'
      } // Include auth token as an additional header
    });
    socket.on('connect', (_) {
      print('Connected to socket server');
    });

    // Listen for custom events
    socket.on('messageReceived', (data) {
      Message message = Message.fromJson(data);
      print(message);

      chatRooms[message.chatId]?.lastMessage = message;
      if(currentChatRoom.id == message.chatId){
        currentRoomMessages.add(message);
      } else {
        allMessages[message.chatId]?.add(message);
      }
      //
      // print(data);
      print("----------------------------------------------------------------------------------");

    });

    // Emit a message to the server
    socket.emit('eventName', 'Hello from Flutter');
  }

  @override
  void onInit() async {
    socketInitializer();
    getAllChatRooms();
    super.onInit();
  }

  void getAllChatRooms() async {
    try {

      var response = await ChatApiClient.getChatRooms();
      List<ChatRoom> list = [];
      for (var i in response.data["data"]) {
        list.add(ChatRoom.fromJson(i));
      }
      print(list.length);
      currentChatRoom = list[0];
      for(var cr in list){
        chatRooms[cr.id] = cr;
      }
      // TODO: update map also
    } catch (e) {
      print(e);
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {}
  }

  void openChat(ChatRoom chatRoom) {
    currentChatRoom = chatRoom;
    Get.toNamed("/chat");
  }

  void getCurrentRoomMessages() async {
    try {
      if(allMessages.containsKey(currentChatRoom.id)){
        currentRoomMessages.value = allMessages[currentChatRoom.id]!;
      }
      var response = await ChatApiClient.getAllMessages(currentChatRoom.id);
      List<Message> list = [];
      for (var i in response.data["data"]){
        list.add(Message.fromJson(i));
      }
      currentRoomMessages.value = list;
      allMessages[currentChatRoom.id] = list;

    } catch (e) {
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {}
  }

  void sendMessage() async {
    try {
      String chatId = currentChatRoom.id;
      SendMessageRequest data = SendMessageRequest(content: messageController.text);
      var response = await ChatApiClient.sendMessage(chatId, data);
      messageController.text = "";
      currentRoomMessages.add(Message.fromJson(response.data["data"]));
      // allMessages[currentChatRoom.id]?.add(Message.fromJson(response.data["data"]));
    } catch (e) {
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {}
  }

  void getAllChatRooms1() {
    try {} catch (e) {
      if (e is DioException) errorText(e.response?.data["msg"]);
    } finally {}
  }


}

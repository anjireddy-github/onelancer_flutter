import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/controllers/chat_controller.dart';
import 'package:onelancer_flutter/model/chat.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';

import '../../theme/appTheme.dart';
import '../../widgets/customTextFormField.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = Get.find();
  AuthController authController = Get.find();



  @override
  void initState() {
    chatController.getCurrentRoomMessages();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    void _scrollToBottom() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    ChatRoom  currentRoom = chatController.currentChatRoom;
    Participant p = Participant(id: "", user: "", firstName: "", profileImage: "");
    for(var i in currentRoom.participants){
      if(i.user != authController.uid){
        p = i;
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(p.firstName),
            Text("Online", style: CustomTextStyles.bodySmallGreen,),
          ],
        ),
        elevation: 5,
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return [
              PopupMenuItem(child: Text('Block', style: CustomTextStyles.bodyMediumBlack,)),
              PopupMenuItem(child: Text('Delete', style: CustomTextStyles.bodyMediumBlack,)),
            ];
          },  icon: const Icon(Icons.more_vert))
        ],

      ),
      body: Column(
        children: [
          // Container(
          //   height: 30,
          //   width: double.infinity,
          //   color: themeColors.indigo300,
          //   child: Center(child: Text("Create Contract", style: theme.textTheme.bodyLarge,)),
          // ),
          Obx(() {
            List<Message> currentMessages = chatController.currentRoomMessages;
            print("messages : ${currentMessages.length}");

            return Expanded(child: Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
                controller: scrollController,
              itemCount: currentMessages.length,
                itemBuilder: (context,index) =>
                    buildMessage(isSentByMe: currentMessages[index].sender.user == authController.uid,
                        message: currentMessages[index].content)),
            ));}),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.attach_file),
                color: themeColors.indigo300,
              ),
              Expanded(
                  child: CustomTextFormField(
                    hintText: "Type your message...",
                    textInputType: TextInputType.text,
                    controller: chatController.messageController,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                    fillColor: themeColors.indigo50,
                    autofocus: false,
                    suffix: IconButton(

                      onPressed: () {
                        chatController.sendMessage();
                      },
                      icon: const Icon(
                        Icons.send,
                        size: 24,
                      ),
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildMessage({required bool isSentByMe, required String message}) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 1),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSentByMe ? 12 : 12),
            topRight: Radius.circular(isSentByMe ? 12 : 12),
            bottomLeft: Radius.circular(isSentByMe ? 12 : 0),
            bottomRight: Radius.circular(isSentByMe ? 0 : 12),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }



}


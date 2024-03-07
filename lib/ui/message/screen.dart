import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/controllers/chat_controller.dart';
import 'package:onelancer_flutter/model/chat.dart';
import 'package:onelancer_flutter/utils/time_utils.dart';

import '../../theme/appTheme.dart';
import '../../widgets/customTextFormField.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  ChatController chatControllerr = Get.find();
  AuthController authController = Get.find();



  @override
  Widget build(BuildContext context) {

    print(chatControllerr.chatRooms.length);
    return Scaffold(
        body: Column(
      children: [
        CustomTextFormField(
          hintText: "Search",
          textInputType: TextInputType.text,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          // borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
          autofocus: false,
          suffix: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24,
            ),
          ),
        ),
        Expanded(
          child:
          Obx(() =>
          ListView.builder(
              itemCount: chatControllerr.chatRooms.length,
              itemBuilder: (context, index) {
                ChatRoom room = chatControllerr.chatRooms.values.toList()[index];
                Participant p = Participant(id: "", user: "", firstName: "", profileImage: "");
                for(var i in room.participants){
                  if(authController.uid != i.user){
                    p = i;
                    break;
                  }
                }
                return ListTile(
                    onTap: () {
                      chatControllerr.openChat(room);
                    },
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${p.firstName}',
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Text(
                            "5", // Replace with your actual message count
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          room.lastMessage?.content ?? "",
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          TimeUtils.formatRelativeTime(room.lastMessage?.createdAt ?? DateTime.now()),
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
         );
              })),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("name of the  person"),
        elevation: 5,
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return [
              PopupMenuItem(child: const Text('Block')),
              PopupMenuItem(child: const Text('Delete')),
            ];
          },  icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        
        children: [
        Expanded( 
          child: Text("chat"),),
        Divider(),
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(hintText: "Send a message...", border: InputBorder.none),
              )
            ),
            IconButton(onPressed: null, icon: Icon(Icons.attach_file)),
            IconButton(onPressed: () {}, icon: Icon(Icons.send))
          ],
        )
      ]),
    );
  }
}

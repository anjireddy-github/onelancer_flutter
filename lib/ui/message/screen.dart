import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messgaes"),
        
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(hintText: "Search",
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder())
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed("/chat");
                  },
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text('User $index'),
                  subtitle: Text('This is message number $index'),
                );
              }
            ),
          ),
        ],
      )
    );
  }
}
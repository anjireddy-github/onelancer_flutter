import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WriteProposal extends StatefulWidget {
  const WriteProposal({super.key});

  @override
  State<WriteProposal> createState() => _WriteProposalState();
}

class _WriteProposalState extends State<WriteProposal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit a Proposal'),
      ),
      body: Column(
        children: [
          Text("Project Details Card"),
          TextField(
            decoration: InputDecoration(labelText: "Price"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Cover Letter"),
            maxLines: 10,
            minLines: 4,
          ),
          InputChip(label: Text("Attch")),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(child: Text("Submit"), onPressed: () {}),
            ElevatedButton(child: Text("Cancel"), onPressed: null),
          ])
        ],
      ),
    );
  }
}

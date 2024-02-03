import 'package:flutter/material.dart';

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
        title: const Text('Submit a Proposal'),
      ),
      body: Column(
        children: [
          const Text("Project Details Card"),
          const TextField(
            decoration: InputDecoration(labelText: "Price"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Cover Letter"),
            maxLines: 10,
            minLines: 4,
          ),
          const InputChip(label: Text("Attach")),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(child: const Text("Submit"), onPressed: () {}),
            const ElevatedButton(onPressed: null, child: Text("Cancel")),
          ])
        ],
      ),
    );
  }
}

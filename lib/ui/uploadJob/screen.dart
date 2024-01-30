import 'package:flutter/material.dart';

class UploadProject extends StatefulWidget {
  const UploadProject({super.key});

  @override
  State<UploadProject> createState() => _UploadProjectState();
}

class _UploadProjectState extends State<UploadProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Job'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Description"),
            minLines: 4,
            maxLines: 10,
          ),
          Text("Required Skills"),
          TextField(decoration: InputDecoration(hintText: "Need to add input Chip")),

          Text("Project Size"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            InputChip(label: Text('Large (more than 6 months)'), selected: true,),
            InputChip(label: Text('Medium (between 1 to 3 months)')),
            InputChip(label: Text('Small (less than 1 month)')),
            InputChip(label: Text('Quick')),
          ]),


          Text("Price Type"),
          Row(children: [
            InputChip(label: Text('Fixed'), selected: true,),
            InputChip(label: Text('Hourly')),
          ]),

          TextField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(labelText: 'Price'),
          ),

          InputChip(label: Text("+ atach")),
          Text("Max size  of file is 5MB."),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: null, child: Text("Save as Draft")),
              ElevatedButton(onPressed: () {}, child: Text("Post Job")),

            ],
          )


        ],
      ),
    );
  }
}
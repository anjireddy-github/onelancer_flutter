import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/job_controller.dart';
import 'package:onelancer_flutter/model/job.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';

class JobDetails extends StatefulWidget {
  final JobResponse jobDetails;
  const JobDetails({super.key,required this.jobDetails});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  bool showless = true;
  List<String> skills = ["node.js", "python", "gpt", "macro", "analog", "hadoop"];
  JobController jobController = Get.find();
  @override
  Widget build(BuildContext context) {
    String description = widget.jobDetails.data;
    String slicedDescription =
    showless ? (description.length > 150 ? description.substring(0, 150) : description) : description;

    return Card(
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          jobController.openWriteProposal(widget.jobDetails);
        },
        child: Container(
            padding: const EdgeInsets.all(16),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(widget.jobDetails.title,
              style: CustomTextStyles.bodyLargeBlack,
              ),
              const SizedBox(height: 8,),
              Text("Fixed Price | Est. Budget INR: ${widget.jobDetails.priceDetails.value}", style: CustomTextStyles.bodySmallBluegray900,),
              const SizedBox(height: 12,),
              Text(slicedDescription),
              if(description.length > 150)
                InkWell(
                  onTap: () {
                    setState(() {
                      showless = !showless;
                    });
                  },
                  child: Text(
                    showless ? "show more" : "show less",
                    style: CustomTextStyles.textButtonMedium,
                  ),
                ),
              SizedBox(height: 8,),
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: skills.map((e) =>
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.only(left: 12, top: 2, bottom: 2, right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: themeColors.indigo50,
                      ),
                      child: Text(e,),
                    )).toList(),
                ),
              ),
              SizedBox(height: 12,),
              Text("CLIENT   Rating : 4.5(9) | Spent: INR 100,000 | Verified", style: theme.textTheme.bodySmall,),
              SizedBox(height: 8,),
              Text("9 minutes ago | 3 proposals | 3 coins required"),
            ],
          )
        ),
      ),
    );
  }
}

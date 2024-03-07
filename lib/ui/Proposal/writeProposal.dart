import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/job_controller.dart';
import 'package:onelancer_flutter/controllers/proposal_controller.dart';
import 'package:onelancer_flutter/model/job.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/ui/home/widgets/ProjectDetails.dart';
import 'package:onelancer_flutter/utils/validation_utils.dart';
import 'package:onelancer_flutter/widgets/OFTextFormField.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';

import '../../theme/customTextStyles.dart';
import '../../widgets/customTextFormField.dart';

class WriteProposal extends StatefulWidget {
  const WriteProposal({super.key});

  @override
  State<WriteProposal> createState() => _WriteProposalState();
}

class _WriteProposalState extends State<WriteProposal> {
  ProposalController proposalController = ProposalController();
  JobController jobController = Get.find();

  @override
  Widget build(BuildContext context) {
    JobResponse? jobDetails = jobController.selectedJob;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Proposal'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildJobDetails(jobDetails!),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Price",
                  style: theme.textTheme.titleLarge,
                ),
                const Text(
                  "Client est. : \$1500",
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  hintText: "\$100",
                  textInputType: TextInputType.number,
                  controller: proposalController.priceController,
                      validator: (value) {
                    return ValidationUtils.validateNumericMax(value,
                        maxValue: int.parse(jobDetails.priceDetails.value));
                  },
                  borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                ),
                const SizedBox(
                  height: 16,
                ),
                // const Divider(),
                // const SizedBox(
                //   height: 16,
                // ),
                Text(
                  "Proposal",
                  style: theme.textTheme.titleLarge,
                ),
                const Text(
                  "Write a detailed proposal",
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "",
                    textInputType: TextInputType.multiline,
                    maxLines: 8,
                    controller: proposalController.detailController,
                    validator: ValidationUtils.validateRequired,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    // borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                    autofocus: false),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Timeline",
                  style: theme.textTheme.titleLarge,
                ),
                const Text(
                  "Client est. : 7 days",
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          hintText: "5",
                          textInputType: TextInputType.number,
                          controller: proposalController.daysController,
                          validator: (value) {
                            return ValidationUtils.validateNumericMax(value,
                                maxValue: int.parse(jobDetails.expectedDuration.days));
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          // borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                          autofocus: false),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("days"),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Chip(
                //       avatar: Icon(Icons.attach_file),
                //       label: Text("Attach"),
                //     ),
                //     Text(
                //       "cover_letter_uploaded.pdf",
                //       style: CustomTextStyles.titleSmallGreen600,
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // const Divider(),
                // const SizedBox(
                //   height: 16,
                // ),
                Text(
                  "Bids",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Required Bids for this job : 3",
                    ),
                    CustomTextFormField(
                      width: 100,
                      hintText: "3",
                      controller: proposalController.coinsController,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        return ValidationUtils.validateNumericMin(value,
                            minValue: 3);
                      },
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      // borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                      autofocus: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(() => Align(alignment: Alignment.topLeft, child: Text(proposalController.errorText.value, style: CustomTextStyles.titleSmallRed700,))),

                const SizedBox(
                  height: 50,
                ),
                Obx(() =>
                CustomElevatedButton(
                  text: "Submit Proposal",
                  height: 35,
                  isDisabled: proposalController.isLoading.value,
                  isLoading: proposalController.isLoading.value,
                  alignment: Alignment.center,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      proposalController.submitProposal();
                    }
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobDetails(JobResponse jobDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Job Details",
              style: theme.textTheme.titleLarge,
            )),
        const SizedBox(
          height: 16,
        ),
        Text(jobDetails.title,
          style: CustomTextStyles.bodyLargeBlack,
        ),
        Text(jobDetails.data),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

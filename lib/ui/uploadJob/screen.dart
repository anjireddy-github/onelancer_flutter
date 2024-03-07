import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customButtonStyles.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/utils/validation_utils.dart';
import 'package:onelancer_flutter/widgets/FullScreenLoadingIndicator.dart';
import 'package:onelancer_flutter/widgets/OFTextFormField.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';

import '../../controllers/job_controller.dart';

class UploadJob extends StatefulWidget {
  const UploadJob({super.key});

  @override
  State<UploadJob> createState() => _UploadProjectState();
}

class _UploadProjectState extends State<UploadJob> {
  JobController jobController = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Job'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Give a title to you job"),
                    OFTextFormField(
                      controller: jobController.titleController,
                      hintText: 'Title of the Job',
                      maxLines: null,
                      textStyle: const TextStyle(color: Colors.black),
                      validator: ValidationUtils.validateRequired,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                        "Describe the kind of freelancer you need in few words"),
                    OFTextFormField(
                      controller: jobController.experienceTitleController,
                      hintText: 'Ex: Experienced node developer',
                      maxLines: null,
                      textStyle: const TextStyle(color: Colors.black),
                      validator: ValidationUtils.validateRequired,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Describe the clear details of you projects"),
                    OFTextFormField(
                      controller: jobController.descriptionController,
                      hintText: 'Description',
                      maxLines: null,
                      textStyle: const TextStyle(color: Colors.black),
                      minLines: 4,
                      validator: ValidationUtils.validateRequired,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Set Your Budget (min : 100)"),
                    Text(
                      "Currently we are facilitating only INR",
                      style: theme.textTheme.bodySmall,
                    ),
                    OFTextFormField(
                      controller: jobController.priceController,
                      hintText: '1000',
                      prefixIcon: Icons.currency_rupee,
                      keyboardType: TextInputType.number,
                      textStyle: const TextStyle(color: Colors.black),
                      validator: (value) {
                        return ValidationUtils.validateNumericMin(value,
                            minValue: 100);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Set Your Job Size (min : 1 day)"),
                    OFTextFormField(
                      controller: jobController.daysController,
                      hintText: 'no of days to complete',
                      prefixIcon: Icons.timer,
                      keyboardType: TextInputType.number,
                      textStyle: const TextStyle(color: Colors.black),
                      validator: (value) {
                        return ValidationUtils.validateNumericMin(value,
                            minValue: 1);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "node: Uploading attachments - Coming soon",
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => Align(alignment: Alignment.topLeft, child: Text(jobController.errorText.value, style: CustomTextStyles.titleSmallRed700,))),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 120,
                            child: CustomElevatedButton(
                              text: "Draft",
                              buttonStyle: CustomButtonStyles.fillIndigo,
                              buttonTextStyle: CustomTextStyles.bodyLargeBlack,
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  jobController.draftJob();
                                }
                              },
                            )),
                        SizedBox(
                          width: 130,
                          child: CustomElevatedButton(
                              text: "Post",
                              onPressed: () {

                                if (formKey.currentState?.validate() ?? false) {
                                  jobController.postJob();
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          Obx(() => jobController.isLoading.value ? FullScreenLoadingIndicator() : Container()),
        ],
      ),
    );
  }
}

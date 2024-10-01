import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resonate/controllers/network_controller.dart';
import 'package:resonate/utils/app_images.dart';
import 'package:resonate/utils/ui_sizes.dart';

class NewNoConnectionDialog extends StatelessWidget {
  NewNoConnectionDialog({super.key});

  final networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: UiSizes.height_20,
                horizontal: UiSizes.width_40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.noConnectionImage,
                    height: UiSizes.height_246,
                  ),
                  Text(
                    "No Connection",
                    style: TextStyle(
                      fontSize: UiSizes.size_40,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Text(
                    "There is a connection error. Please check your internet and try again.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: UiSizes.height_60,
                  ),
                  Obx(
                    () => SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          networkController.tryAgain();
                        },
                        child: networkController.isLoading.value
                            ? Center(
                                child: LoadingAnimationWidget
                                    .horizontalRotatingDots(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  size: UiSizes.size_40,
                                ),
                              )
                            : const Text(
                                "Try Again",
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
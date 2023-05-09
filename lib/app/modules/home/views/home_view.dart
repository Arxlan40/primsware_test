import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:primsware_test/app/modules/home/views/title_widget.dart';
import 'package:primsware_test/app/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        floatingActionButton: SizedBox(
          height: 7.h,
          width: 80.w,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            onPressed: () {},
            isExtended: true,
            backgroundColor: Colors.amberAccent,
            child: Center(
              child: Text(
                "FINISH",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GetBuilder<HomeController>(builder: (value) {
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 7.5.h,
                    width: 7.5.h,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color:  AppColors.greyBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.apple,
                        color: AppColors.white,
                        size: 30.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleWidget(
                            title: "Which piqs you interested?",
                            subtitle: "Please select at least (1)"),
                        SizedBox(height: 2.h),
                        Wrap(
                          spacing: 25,
                          children: value.buildCategoryChips(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const TitleWidget(
                      title: "Which kind of food?",
                      subtitle: "More selections = Better suggestions"),
                  SizedBox(
                    height: 1.h,
                  ),
                  Wrap(
                    spacing: 5,
                    children: value.buildSubcategoryCheckboxes(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}



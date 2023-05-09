import 'package:flutter/material.dart';
import 'package:primsware_test/app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 9.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:primsware_test/app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    this.color = AppColors.white,
    required this.icon,
    required this.title,
    super.key,
  });

  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
            height: 7.5.h,
            width: 7.5.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:  AppColors.greyBlack,
              shape: BoxShape.circle,
              border: Border.all(
                color: color == AppColors.white ? AppColors.borderGrey :color,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 30.sp,
              ),
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: color),
          )
        ],
      ),
    );
  }
}

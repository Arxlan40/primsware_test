import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primsware_test/app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    this.color = AppColors.white,
    required this.icon,
    required this.title,
    required this.selected,
    super.key,
  });

  final Color color;
  final IconData icon;
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          height: 5.5.h,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: AppColors.greyBlack,
              border: Border.all(
                color: color == AppColors.white ? AppColors.borderGrey : color,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (selected)
                Icon(
                  CupertinoIcons.arrow_right_circle,
                  color: color,
                  size: 16.sp,
                ),
              if (selected)
                SizedBox(
                  width: 1.w,
                ),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: color,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )),
    );
  }
}

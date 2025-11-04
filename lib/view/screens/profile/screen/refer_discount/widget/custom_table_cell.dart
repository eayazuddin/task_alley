import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableCellWidget extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool isStatus;

  const TableCellWidget({
    super.key,
    required this.text,
    this.isHeader = false,
    this.isStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isHeader
        ? Colors.black
        : isStatus
        ? (text == "Active" ? Colors.green : Colors.red)
        : Colors.black87;

    return Expanded(
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
            fontSize: 13.sp,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

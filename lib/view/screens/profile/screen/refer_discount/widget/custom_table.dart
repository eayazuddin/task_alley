import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTable extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> rows;

  const CustomTable({
    super.key,
    required this.headers,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          // Header row
          _buildRow(headers, isHeader: true),

          // Data rows
          ...rows.map((row) => _buildRow(row)).toList(),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> data, {bool isHeader = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isHeader ? Colors.grey.shade300 : Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          for (int i = 0; i < data.length; i++) ...[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Center(
                  child: Text(
                    data[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight:
                      isHeader ? FontWeight.w600 : FontWeight.w400,
                      color: isHeader
                          ? Colors.black
                          : (data[i].toLowerCase() == "active"
                          ? Colors.green
                          : data[i].toLowerCase() == "used"
                          ? Colors.red
                          : Colors.black87),
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
            // Add vertical divider except last column
            if (i < data.length - 1)
              Container(width: 1, height: 24.h, color: Colors.grey.shade300),
          ],
        ],
      ),
    );
  }
}

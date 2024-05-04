

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UReportCardWidget extends StatelessWidget {
  final String date;
  final int documents;
  final String title;
  final String img;
  final int index;
  final bool isExpanded; // Added
  final Function() onTap; // Added

  UReportCardWidget({
    required this.date,
    required this.index,
    required this.documents,
    required this.title,
    required this.img,
    required this.isExpanded, // Modified
    required this.onTap, // Modified
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap, // Use the onTap provided by the parent
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: screenWidth,
        height: isExpanded ? 190.h : 126.h, // Use the isExpanded flag
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        ),
        // The rest of your widget code remains the same
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  children: [
                    // Image container
                    index == index
                        ? Container(
                      height: 81.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Center(
                        child: Image.asset(
                          img,
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : SizedBox(),
                    SizedBox(width: 10.w),
                    // Text section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              index == index
                                  ? Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff5EEF8F),
                                          Color(0xff00A69D),
                                        ],
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox()
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '${documents} Documents',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff00A69D),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Last Updates: ${date}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Action buttons row
            if (isExpanded)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.download, 'Download', () {
                    print('Download tapped');
                  }),
                  _buildActionButton(Icons.update, 'Update', () {
                    // Implement your update logic here
                    print('Update tapped');
                  }),
                  _buildActionButton(Icons.delete, 'Delete', () {
                    // Implement your delete logic here
                    print('Delete tapped');
                  }, color: Colors.red),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text, VoidCallback onTap,
      {Color? color}) {
    return GestureDetector(
      onTap: onTap,
      behavior:
      HitTestBehavior.opaque, // This is important to stop event propagation
      child: Column(
        children: [
          Icon(
            icon,
            color: color ?? Color(0xff00A69D),
            size: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff888888),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class UReportTypeCardWidgets extends StatelessWidget {
  final String date;
  final int documents;
  final String title;
  final String img;
  final int index;

  final Function() onTap; // Added

  UReportTypeCardWidgets({
    required this.date,
    required this.index,
    required this.documents,
    required this.title,
    required this.img,
    required this.onTap, // Modified
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: screenWidth,
        height: 126.h,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  children: [
                    // Image container
                    index == index
                        ? Container(
                      height: 81.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Center(
                        child: Image.asset(
                          img,
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : SizedBox(),
                    SizedBox(width: 10.w),
                    // Text section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '${documents} Documents',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff00A69D),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Last Updates: ${date}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:baby_hub/utils/app_constant.dart';
import 'package:flutter/material.dart';

class headingWidget extends StatelessWidget {
   final String headingTitle;
  final String headingSubTitle;
  final VoidCallback onTap;
  final String buttonText;
 const headingWidget({super.key,
  required this.headingTitle,
    required this.headingSubTitle,
    required this.onTap,
    required this.buttonText,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:5.0 ,vertical:10.0 ),
      child: Padding(padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headingTitle,
              style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.grey.shade800),) , 
                    Text(headingSubTitle,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0,
              color: Colors.grey),
              ) , 
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: appConstant.appMainColor,
              width: 1.5),),
              child: Padding(padding:   EdgeInsets.all(8.0),
              child: Text(buttonText,style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 12.0,color: appConstant.appScendoryColor),),
              ),
            ),
          )
        ],
      ),
      )

    );
  }
}

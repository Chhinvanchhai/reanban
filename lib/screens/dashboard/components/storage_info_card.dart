import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class StorageInfo extends StatelessWidget {
  const StorageInfo({
    Key? key,
    required this.icon,
    required this.title,
    required this.amountFile,
    required this.amountUsage,
  }) : super(key: key);
  final String icon, title, amountFile, amountUsage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              icon,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, height: 1),
                    ),
                    Text(
                      amountFile,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, height: 1),
                    )
                  ]),
            ),
          ),
          Text(amountUsage)
        ],
      ),
    );
  }
}

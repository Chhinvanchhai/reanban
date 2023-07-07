import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetail extends StatelessWidget {
  const StorageDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Storage Detail',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
          Chart(),
          SizedBox(
            height: 10,
          ),
          StorageInfo(
            title: 'Document Files',
            icon: 'assets/icons/Documents.svg',
            amountFile: '1002 files',
            amountUsage: '2G',
          ),
          StorageInfo(
            title: 'Medai Files',
            icon: 'assets/icons/media.svg',
            amountFile: '1002 files',
            amountUsage: '12G',
          ),
          StorageInfo(
            title: 'Ohter File',
            icon: 'assets/icons/one_drive.svg',
            amountFile: '1002 files',
            amountUsage: '2G',
          ),
          StorageInfo(
            title: 'Unknow File',
            icon: 'assets/icons/unknown.svg',
            amountFile: '1022 files',
            amountUsage: '3G',
          )
        ],
      ),
    );
  }
}

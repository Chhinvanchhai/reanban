import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/api/api.dart';
import 'package:reanban/models/Feed.dart';

class ProductController extends GetxController {
  var items = <Feed>[].obs;
  var page = 1, totalPage = 1;
  var pageSize = 15;
  var loading = false;

  bool isLoadMore = true;
  final scrollController = ScrollController();

  @override
  void onInit() {
    // scrollController.addListener(() {
    //   if (scrollController.position.maxScrollExtent ==
    //       scrollController.offset) {
    //     if (isLoadMore) {
    //       page += 1;
    //       print(page);
    //       pagination(page,pageSize);
    //     }
    //   }
    // });

    super.onInit();
  }

  Future<void> added() async {}
  Future<void> deleted() async {}
  Future<void> updated() async {}

  Future<void> pagination(page, pageSize) async {
    var response = await Api.get(
        "/admin/products/pagination?page=$page&rowsPerPage=$pageSize");
    var data = jsonDecode(response.body);
    if (data['data']?.length == 0) {
      isLoadMore = false;
    }
    totalPage = data["totalPages"];
    items.value = (data['data'] as List).map((i) => Feed.fromJson(i)).toList();
    update();
  }
}

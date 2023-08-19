import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/api/api.dart';
import 'package:reanban/models/Feed.dart';

class FeedController extends GetxController {
  var items = <Feed>[].obs;
  var page = 1, totalPage = 1;
  var loading = false;

  bool isLoadMore = true;
  final scrollController = ScrollController();

  @override
  void onInit() {
    pagination(page).then((value) => loading = false);

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (isLoadMore) {
          page += 1;
          print(page);
          pagination(page);
        }
      }
    });

    super.onInit();
  }

  Future<void> added() async {}
  Future<void> deleted() async {}
  Future<void> updated() async {}

  Future<void> pagination(page) async {
    var response =
        await Api.get("/admin/products/pagination?page=${page}&rowsPerPage=10");
    var data = jsonDecode(response.body);
    print(data);
    if (data['data']?.length == 0) {
      isLoadMore = false;
    }
    print(data["total"]);
    totalPage = data["total"];
    items.addAll((data['data'] as List).map((i) => Feed.fromJson(i)).toList());
    update();
  }
}

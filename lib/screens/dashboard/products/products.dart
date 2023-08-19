import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/controllers/ProductController.dart';
import 'package:reanban/screens/dashboard/products/components/add.dart';
import 'package:reanban/utils/h1.dart';
import 'package:reanban/widgets/dialog.dart';

class Products extends StatefulWidget {
  static const routeName = 'feature/dark-mode';

  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ProductController productController = Get.put(ProductController());
  var page = 1;
  var pageSize = 15;
  @override
  void initState() {
    super.initState();
  }

  List<PlutoRow> rows = [];

  List<PlutoRow> getItem(page, pageSize) {
    productController.pagination(page, pageSize);
    List<PlutoRow> newRows = [];
    for (var element in productController.items) {
      newRows.add(PlutoRow(cells: {
        'id': PlutoCell(value: element.id),
        'name': PlutoCell(value: element.title),
        'category': PlutoCell(value: element.view),
      }));
    }
    return newRows;
  }

  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'id'.tr,
      field: 'id',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'name'.tr,
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: "category".tr,
      field: 'category',
      type: PlutoColumnType.text(),
    ),
  ];

  Future<PlutoLazyPaginationResponse> fetch(
    PlutoLazyPaginationRequest request,
  ) async {
    await productController.pagination(request.page, pageSize);
    await Future.delayed(const Duration(milliseconds: 500));
    return Future.value(PlutoLazyPaginationResponse(
        totalPage: productController.totalPage, rows: getItem(page, pageSize)));
  }

  void onSearch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Theme(
          data: ThemeData.dark(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: defaultHeight,
                        width: 240,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              label: Text('Name'),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
                              border: OutlineInputBorder(),
                              hintText: "Name"),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: defaultHeight,
                        width: 240,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              label: Text('Category'),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
                              border: OutlineInputBorder(),
                              hintText: "Category"),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: defaultHeight,
                        width: 240,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              label: Text('Love'),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
                              border: OutlineInputBorder(),
                              hintText: "Love"),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4)),
                          child: TextButton(
                            onPressed: onSearch,
                            child: Text("Search", ),
                          ))
                    ],
                  ),
                  Add()
                ],
              ),
              SizedBox(
                height: defaultPadding / 2,
              ),
              Expanded(
                child: PlutoGrid(
                  columns: columns,
                  rows: rows,
                  onChanged: (PlutoGridOnChangedEvent event) {
                    print("chage====R");
                  },
                  configuration: const PlutoGridConfiguration.dark(),
                  createFooter: (stateManager) {
                    return PlutoLazyPagination(
                      // Determine the first page.
                      // Default is 1.
                      initialPage: 1,

                      // First call the fetch function to determine whether to load the page.
                      // Default is true.
                      initialFetch: true,

                      // Decide whether sorting will be handled by the server.
                      // If false, handle sorting on the client side.
                      // Default is true.
                      fetchWithSorting: true,

                      // Decide whether filtering is handled by the server.
                      // If false, handle filtering on the client side.
                      // Default is true.
                      fetchWithFiltering: true,

                      // Determines the page size to move to the previous and next page buttons.
                      // Default value is null. In this case,
                      // it moves as many as the number of page buttons visible on the screen.
                      pageSizeToMove: null,
                      fetch: fetch,
                      stateManager: stateManager,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:reanban/controllers/FeedController.dart';

class About extends StatefulWidget {
  static const routeName = 'feature/dark-mode';

  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  FeedController feedController = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
  }

  List<PlutoRow> rows = [];

  List<PlutoRow> getItem(page) {
    feedController.pagination(page);
    List<PlutoRow> newRows = [];
    for (var element in feedController.items) {
      newRows.add(PlutoRow(cells: {
        'id': PlutoCell(value: element.id),
        'name': PlutoCell(value: element.title),
        'age': PlutoCell(value: element.view),
        'role': PlutoCell(value: 'Programmer'),
        'joined': PlutoCell(value: '2021-01-01'),
        'working_time': PlutoCell(value: '09:00'),
        'salary': PlutoCell(value: 300),
      }));
    }
    return newRows;
  }

  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Name',
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Age',
      field: 'age',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Role',
      field: 'role',
      type: PlutoColumnType.select(<String>[
        'Programmer',
        'Designer',
        'Owner',
      ]),
    ),
    PlutoColumn(
      title: 'Joined',
      field: 'joined',
      type: PlutoColumnType.date(),
    ),
    PlutoColumn(
      title: 'Working time',
      field: 'working_time',
      type: PlutoColumnType.time(),
    ),
    PlutoColumn(
      title: 'salary',
      field: 'salary',
      type: PlutoColumnType.currency(),
      // footerRenderer: (rendererContext) {
      //   return PlutoAggregateColumnFooter(
      //     rendererContext: rendererContext,
      //     formatAsCurrency: true,
      //     type: PlutoAggregateColumnType.sum,
      //     format: '#,###',
      //     alignment: Alignment.center,
      //     titleSpanBuilder: (text) {
      //       return [
      //         const TextSpan(
      //           text: 'Sum',
      //           style: TextStyle(color: Colors.red),
      //         ),
      //         const TextSpan(text: ' : '),
      //         TextSpan(text: text),
      //       ];
      //     },
      //   );
      // },
    ),
  ];

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    PlutoColumnGroup(title: 'User information', fields: ['name', 'age']),
    PlutoColumnGroup(title: 'Status', children: [
      PlutoColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
      PlutoColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
    ]),
  ];

  Future<PlutoLazyPaginationResponse> fetch(
    PlutoLazyPaginationRequest request,
  ) async {
    List<PlutoRow> tempList = [];
    // if (request.sortColumn != null && !request.sortColumn!.sort.isNone) {
    //   tempList = [...tempList];

    //   tempList.sort((a, b) {
    //     final sortA = request.sortColumn!.sort.isAscending ? a : b;
    //     final sortB = request.sortColumn!.sort.isAscending ? b : a;

    //     return request.sortColumn!.type.compare(
    //       sortA.cells[request.sortColumn!.field]!.valueForSorting,
    //       sortB.cells[request.sortColumn!.field]!.valueForSorting,
    //     );
    //   });
    // }
    final page = request.page;
    const pageSize = 100;
    // final totalPage = (tempList.length / pageSize).ceil();
    final start = (page - 1) * pageSize;
    final end = start + pageSize;

    // Iterable<PlutoRow> fetchedRows = tempList.getRange(
    //   max(0, start),
    //   min(tempList.length, end),
    // );

    await Future.delayed(const Duration(milliseconds: 500));

    return Future.value(PlutoLazyPaginationResponse(
        totalPage: feedController.totalPage, rows: getItem(page)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData.dark(),
        child: PlutoGrid(
          columns: columns,
          rows: rows,
          onChanged: (PlutoGridOnChangedEvent event) {
            print(event);
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
    );
  }
}

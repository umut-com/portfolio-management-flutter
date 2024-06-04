import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_management/app_constant.dart';

class CustomDataTable extends StatefulWidget {
  const CustomDataTable(
      {super.key,
      required this.columns,
      required this.rows,
      this.height,
      this.width = double.maxFinite,
      this.onPageChanged,
      this.minWidth = dataTable_ColumnWidth_minWidth,
      this.smRatio = 0.67,
      this.lmRatio = 1.2,
      this.scrollController,
      this.showBottomBorder = false,
      this.sortColumnIndex,
      this.sortAscending = true,
      this.dataRowHeight = 48,
      this.showCheckboxColumn = false});

  final List<DataColumn> columns;
  final List<DataRow> rows;
  final bool showCheckboxColumn;
  final double? height;
  final double width;

  final double smRatio;

  final double lmRatio;
  final double minWidth;
  final ScrollController? scrollController;
  final Function(int)? onPageChanged;
  final bool showBottomBorder;
  final int? sortColumnIndex;

  final bool sortAscending;

  final double dataRowHeight;

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  @override
  void didUpdateWidget(covariant CustomDataTable oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Theme(
          data: ThemeData(
            useMaterial3: false,
            scrollbarTheme: scrollbarTheme,
          ),
          child: !kIsWeb
              ? ScrollConfiguration(
                  behavior: const ScrollBehavior()
                      .copyWith(physics: const ClampingScrollPhysics()),
                  child: dataTable(),
                )
              : dataTable(),
        ),
      ),
    );
  }

  DataTable2 dataTable() {
    return DataTable2(
      bottomMargin: 10,
      headingRowHeight: dataTable_ColumnWidth_headingRowHeight,
      columnSpacing: dataTable_ColumnWidth_columnSpacing,
      horizontalMargin: dataTable_ColumnWidth_horizontalMargin,
      dataRowHeight: widget.dataRowHeight,
      showCheckboxColumn: widget.showCheckboxColumn,
      datarowCheckboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return kDarkBlueColor;
          }
          return Colors.white;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
      ),
      headingCheckboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return kDarkBlueColor;
          }
          return Colors.white;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
      ),
      headingRowColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
      empty: dataTableEmptyWidget,
      columns: widget.columns,
      rows: widget.rows,
      smRatio: widget.smRatio,
      lmRatio: widget.lmRatio,
      minWidth: widget.minWidth,
      scrollController: widget.scrollController,
      showBottomBorder: widget.showBottomBorder,
      sortColumnIndex: widget.sortColumnIndex,
      sortAscending: widget.sortAscending,
      headingTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, color: kBlackColor, fontSize: 14.5),
      dataTextStyle: const TextStyle(color: kBlackColor),
    );
  }
}

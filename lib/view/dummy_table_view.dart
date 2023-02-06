import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/dummy_data.dart';

class DummyTableView extends StatefulWidget {
  const DummyTableView({Key? key}) : super(key: key);

  @override
  State<DummyTableView> createState() => _DummyTableViewState();
}

class _DummyTableViewState extends State<DummyTableView> {
  bool sort = true;
  List<Data>? filterData;

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        filterData!.sort((a, b) => b.name!.compareTo(a.name!));
      }
    }
  }

  @override
  void initState() {
    filterData = myData;
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Theme(
                    data: ThemeData.light()
                        .copyWith(cardColor: Theme.of(context).canvasColor),
                    child:
                    PaginatedDataTable(
                      sortColumnIndex: 0,
                      sortAscending: sort,

                      header: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                              hintText: "Enter something to filter"),
                          onChanged: (value) {
                            setState(() {
                              myData = filterData!.where((element) => element.name!.contains(value)).toList();
                            });
                          },
                        ),
                      ),
                      source: RowSource(
                        myData: myData,
                        count: myData.length,
                      ),
                      rowsPerPage: 4,
                      columnSpacing: 8,
                      columns: [
                        DataColumn(
                            label: const Text(
                              "Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                sort = !sort;
                              });

                              onsortColum(columnIndex, ascending);
                            }),
                        const DataColumn(
                          label: Text(
                            "Phone",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Age",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Flutter Paginated DataTable With \n\n Sorting \n\n Filtering \n\n Pagination",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 5),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
  }
}
class RowSource extends DataTableSource {
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.name ?? "Name")),
      DataCell(Text(data.phone.toString())),
      DataCell(Text(data.Age.toString())),
    ],
  );
}

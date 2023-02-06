import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_data_model.dart';
import '../utils/table_constant/DataTableConstants.dart';
import '../utils/table_source/CustomPaginatedTable.dart';
import '../utils/table_source/user_api_data_table_source.dart';
import '../view_model/user_data_provider.dart';

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({Key? key}) : super(key: key);

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}


class _DataTableScreenState extends State<DataTableScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<UserDataProvider>(context, listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    //
    debugPrint("Data Table is calling ");
    return Container(
      child:  ChangeNotifierProvider<UserDataProvider>(
        create: (_) => UserDataProvider(),
        child: _InternalWidget(),
      ),
    );
  }
}

class _InternalWidget extends StatelessWidget {
  const _InternalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _provider = context.watch<UserDataProvider>();
    final _model = _provider.userModel;

    if (_model.isEmpty) {
      return const SizedBox.shrink();
    }
    final _dtSource = UserApiDataTableSource(
      onRowSelect: (index) => _showDetails(context, _model[index]),
      userData: _model,
    );

    return CustomPaginatedTable(
      actions: <IconButton>[
        IconButton(
          splashColor: Colors.transparent,
          icon: const Icon(Icons.refresh),
          onPressed: () {
            _provider.fetchData();
            _showSBar(context, DataTableConstants.refresh);
          },
        ),
      ],
      dataColumns: _colGen(_dtSource, _provider),
      header: const Text('Users'),
      onRowChanged: (index) => _provider.rowsPerPage = index,
      rowsPerPage: _provider.rowsPerPage,
      showActions: true,
      source: _dtSource,
      sortColumnIndex: _provider.sortColumnIndex!,
      sortColumnAsc: _provider.sortAscending,
    );
  }

  List<DataColumn> _colGen(
      UserApiDataTableSource _src,
      UserDataProvider _provider,
      ) =>
      <DataColumn>[
        DataColumn(
          label: Text(DataTableConstants.colID),
          numeric: true,
          tooltip: DataTableConstants.colID,
          onSort: (colIndex, asc) {
            _sort<num>((user) => user.id!, colIndex, asc, _src, _provider);
          },
        ),
        DataColumn(
          label: Text(DataTableConstants.colName),
          tooltip: DataTableConstants.colName,
          onSort: (colIndex, asc) {
            _sort<String>((user) => user.name!, colIndex, asc, _src, _provider);
          },
        ),
        DataColumn(
          label: Text(DataTableConstants.colEmail),
          tooltip: DataTableConstants.colEmail,
          onSort: (colIndex, asc) {
            _sort<String>((user) => user.email!, colIndex, asc, _src, _provider);
          },
        ),
        DataColumn(
          label: Text(DataTableConstants.colPhone),
          tooltip: DataTableConstants.colPhone,
        ),
        DataColumn(
          label: Text(DataTableConstants.colWebsite),
          tooltip: DataTableConstants.colWebsite,
        ),
        DataColumn(
          label: Text(DataTableConstants.otherDetails),
          tooltip: DataTableConstants.otherDetails,
        ),
      ];

  void _sort<T>(
      Comparable<T> Function(UserDataModel user) getField,
      int colIndex,
      bool asc,
      UserApiDataTableSource _src,
      UserDataProvider _provider,
      ) {
    _src.sort<T>(getField, asc);
    _provider.sortAscending = asc;
    _provider.sortColumnIndex = colIndex;
  }

  void _showSBar(BuildContext c, String textToShow) {
    ScaffoldMessenger.of(c).showSnackBar(
      SnackBar(
        content: Text(textToShow),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  void _showDetails(BuildContext c, UserDataModel data) async =>
      await showDialog<bool>(
        context: c,
        builder: (_) => Text("Dialog"),


      );
}
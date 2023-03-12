import 'dart:async';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

import '../model/client_model.dart';
import '../view_model/client_view_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late ClientViewModel viewModel;

  bool isLoading = true;
  @override
  void initState() {
    viewModel = Provider.of<ClientViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getUserList(1, 20);
    });
    super.initState();
  }

  /* @override
  void didChangeDependencies() {
    clientViewModel= Provider.of<ClientViewModel>(context);
    // Timer.run(() {
    if(_init){
      clientViewModel.getUserList().then((value) {
        setState(() {
          isLoading = false;
          _init = false;
        });
      });
    }
    // });

    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    debugPrint("DashBoard Calling ");

    return SingleChildScrollView(
        child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Consumer<ClientViewModel>(builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      provider.loading
                          ? CircularProgressIndicator()
                          : Text('Loding Finished'),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(columns: [
                          DataColumn(
                            label: Container(
                              width: 10,
                              child: const Text('#',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              child: const Text('Name',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              child: const Text('Phone',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              child: const Text('Email',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              child: const Text('Action',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                        ], rows: getClientRow(viewModel.getClientArrayList)),
                      )
                    ],
                  );
                }),
                Container(
                  width: 450,
                  child: NumberPaginator(
                    // by default, the paginator shows numbers as center content
                    numberPages: 10,
                    onPageChange: (int index) {
                      setState(() {
                        viewModel.getUserList(20, index);
                        debugPrint("Selected Index $index");
                      });
                    },
                    initialPage: 0,
                  ),
                )
              ],
            )));
  }

  List<DataRow> getClientRow(List<ClientPojo> list) {
    return List.generate(list.length, (index) {
      ClientPojo client = list.elementAt(index);
      return DataRow(cells: [
        DataCell(Text('${client.id}')),
        DataCell(Text('${client.name}')),
        DataCell(Text('${client.phone}')),
        DataCell(Text('${client.email}')),
        DataCell(
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.details)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.print)),


            ],
          ),
        )
      ]);
    });
  }
}

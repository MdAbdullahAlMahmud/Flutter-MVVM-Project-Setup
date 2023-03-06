import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

import '../view_model/client_view_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);



  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

   ClientViewModel? clientViewModel;

  @override
  void didChangeDependencies() {

    Timer.run((){
      clientViewModel = Provider.of<ClientViewModel>(context , listen: false);
      clientViewModel!.getUserList();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: Column(
              children:  [

                const Text(
                  'Dashboard',
                  style:  TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                DataTable(
                    columns:[
                      DataColumn(
                        label: Container(
                          width: 10,
                          child: const Text('#',
                              style:TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.right),
                        ),
                      ),

                      DataColumn(
                        label: Container(
                          child: const Text('Name',
                              style:TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.right),
                        ),
                      ),


                      DataColumn(
                        label: Container(
                          child: const Text('Phone',
                              style:TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.right),
                        ),
                      ),

                        DataColumn(
                        label: Container(
                          child: const Text('Action',
                              style:TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.right),
                        ),
                      ),




                    ] ,
                    rows: []

                ),

                clientViewModel!.loading?const CircularProgressIndicator():Text(" Client Size ${clientViewModel!.getClientList!.data!.length}"),

                NumberPaginator(
                  // by default, the paginator shows numbers as center content
                  numberPages: 100,
                  onPageChange: (int index) {
                    setState(() {
                      debugPrint("Position ${index}");
                    });
                  },
                  // initially selected index
                  initialPage: 4,
                  /*config: const NumberPaginatorUIConfig(
                    // default height is 48
                    height: 64,
                    *//*buttonShape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),*//*
                   // buttonSelectedForegroundColor: Colors.yellow,
                    buttonUnselectedForegroundColor: Colors.white,
                    buttonUnselectedBackgroundColor: Colors.black,
                    buttonSelectedBackgroundColor: Colors.blueGrey,
                  ),*/
                ),

              ],
            )

      ),
    );
  }


}

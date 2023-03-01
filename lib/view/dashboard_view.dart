import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child:

            Column(
              children:  [

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
                 Text(
                  'Dashboard',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
              ],
            )

      ),
    );
  }


}

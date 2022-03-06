import 'package:flutter/material.dart';
import '/model/expense.dart';

import 'budget.dart';
import 'expenlist.dart';

class Body extends StatelessWidget {
  final List<Model> list ;
  final double totalByMoth ;
  late int totalSum =0;
  Function deleteExpense;
  Body(this.list,this.totalByMoth,this.deleteExpense,);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Budget(totalByMoth,totalSum,),
          ExpenseList(list,totalByMoth,deleteExpense,),


        ],
      ),
    );
  }
}

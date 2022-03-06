import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/expense.dart';

class Expense_Item extends StatelessWidget {
  List<Model> list;
  final int i;
  Function deleteExpense;

  Expense_Item(this.list,this.i,this.deleteExpense);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(list[i].id),
      onDismissed: (derection){
        deleteExpense(list[i].id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white,),
      ),
      child: ListTile(
        leading: Icon(list[i].icon),
        title: Text(list[i].title,style: const TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(DateFormat('dd MMMM,y').format(list[i].date)
          ,style: const TextStyle(fontSize: 13),),
        trailing: Text("${list[i].amount} so'm"),
      ),
    );
  }
}

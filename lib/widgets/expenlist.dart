import 'package:flutter/material.dart';
import '/model/expense.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {

  List<Model> list;
  final double totalByMoth ;
  Function deleteExpense;

    ExpenseList(this.list,this.totalByMoth,this.deleteExpense,);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Positioned(
      bottom: 0,
      child: Container(
        clipBehavior:Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        height:  isLandscape? MediaQuery.of(context).size.height *  0.4:
        MediaQuery.of(context).size.height *  0.6,
        decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),),
        ),
          child:totalByMoth==0.0?
           Center(child: Column(
            children:  [
              SizedBox(
                  height: MediaQuery.of(context).size.height *0.25,
                  child: const Image(image: AssetImage('assets/ufo.png'))),
              const Text('Xarajatlar yo\'q'),
            ],
          ),):
          ListView.builder(itemCount: list.length,itemBuilder: (ctx, i){
            return Expense_Item(list,i,deleteExpense);
          }),
      ),
    );
  }
}

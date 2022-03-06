
import 'package:flutter/material.dart';
import '/widgets/progress_bar.dart';

import 'edit_Monthly_budget.dart';

class Budget extends StatefulWidget {
  final double totalByMoth;
  int totalSum;
  Budget(this.totalByMoth,this.totalSum,);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  double budgetLimit = 1000000;

  void showMonthlyBudgetWindow(BuildContext context,){
    showModalBottomSheet(
      isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (ctx){
          return EditMonthlyBudget(changeBudgetLimit,budgetLimit);
        });

  }
  void changeBudgetLimit(double amount){
    setState(() {
      budgetLimit = amount;
    });
    Navigator.of(context).pop();
  }
  var totalLimetPercentage;

  @override
  Widget build(BuildContext context) {
     totalLimetPercentage =100*widget.totalByMoth/budgetLimit;
    totalLimetPercentage = totalLimetPercentage>100?100:totalLimetPercentage;
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 424,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(239, 240, 250, 1),
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Monthly cost'),
                  TextButton.icon(
                    onPressed: (){
                      showMonthlyBudgetWindow(context);
                    },
                    icon:const Icon(Icons.edit,size: 18,),
                    label: Text('$budgetLimit'),
                  ),
                ],
              ),
               Text('${
               totalLimetPercentage.toStringAsFixed(1)
               }%'),

            ],
            // valueColor: tin,
          ),
           progres_bar(totalLimetPercentage)
        ],
      ),
    );
  }
}


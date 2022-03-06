import 'package:flutter/material.dart';

class EditMonthlyBudget extends StatefulWidget {
  Function changeBudgetLimit;
  double budgetLimit;


  EditMonthlyBudget(this.changeBudgetLimit,this.budgetLimit);

  @override
  State<EditMonthlyBudget> createState() => _EditMonthlyBudgetState();
}

class _EditMonthlyBudgetState extends State<EditMonthlyBudget> {
  final Budget = TextEditingController();
  late TextEditingController _budgetAmountController;

  @override
  void initState() {
    _budgetAmountController = TextEditingController();
    _budgetAmountController.text = widget.budgetLimit.toStringAsFixed(1);
    super.initState();
  }
  @override
  void dispose() {
    _budgetAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
        height: MediaQuery.of(context).viewInsets.bottom > 0 ?
        MediaQuery.of(context).viewInsets.bottom+160 :
        360,
        child:Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: Budget,
              decoration: ( InputDecoration(
                label: const Text('Add cost'),
               hintText: '${widget.budgetLimit}'
              )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed:(){
                    Navigator.of(context).pop();
                      },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed:(){
                      if (Budget.text.isEmpty){
                        return;}
                    final amount = double.parse(Budget.text);
                      if (amount>0){
                        widget.changeBudgetLimit(amount);
                      }
                    },
                    child: Text('Add monthly cost')),
              ],
            )
          ],
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import '/model/expense.dart';
import '/widgets/header.dart';
import '/widgets/modalBottom.dart';
import 'widgets/body.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  bool _showExpenseList = true;
  Models modelsDate = Models();

  DateTime selectDate = DateTime.now();
  void addWindow(BuildContext context,) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return ModalBottom(add);
        });
  }
  void showCalender(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectDate = date;
        });
      }
    });
  }
  void nextMoth() {
    setState(() {
      selectDate =
          DateTime(selectDate.year, selectDate.month + 1, selectDate.day);
    });
  }
  void backMoth() {
    setState(() {
      selectDate =
          DateTime(selectDate.year, selectDate.month - 1, selectDate.day);
    });
  }
  void add(String title, DateTime date, double amount, IconData icon) {
    setState(() {
      modelsDate.add(title, date, amount, icon);
    });
    Navigator.of(context).pop();
  }
  void deleteExpense(String id) {
    setState(() {
      modelsDate.delete(id);
    });
  }
  Widget _showPortraitItems(diveHaight,) {
    return SizedBox(
      height:diveHaight,
      child: Column(
        children: [
          Header(showCalender, selectDate, nextMoth, backMoth,
              modelsDate.totalExpenseByMoth(selectDate),),
          Body(modelsDate.sortByMoth(selectDate),
              modelsDate.totalExpenseByMoth(selectDate), deleteExpense,),
        ],
      ),
    );
  }
  Widget _showLandscapeItems(diveHaight){
    return SizedBox(
      height: diveHaight ,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Ro'yhatni ko'rsatish"),
              Switch(
                value: _showExpenseList,
                onChanged: (value) {
                  setState(() {
                    _showExpenseList =value;
                  });
                },
              )
            ],
          ),
          _showExpenseList ?
          Body(modelsDate.sortByMoth(selectDate), modelsDate.totalExpenseByMoth(selectDate), deleteExpense,) :
          Header(showCalender, selectDate, nextMoth, backMoth, modelsDate.totalExpenseByMoth(selectDate),),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      elevation: 0,
      title: const Text("My Cash"),
      centerTitle: true,
    );
    final topPadding = MediaQuery.of(context).padding.top;
    final appBarHaigt = appBar.preferredSize.height;
    final diveHaight = MediaQuery.of(context).size.height -topPadding-appBarHaigt;





    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: appBar,
      body: Column(children: [isLandscape ? _showLandscapeItems(diveHaight) : _showPortraitItems(diveHaight),],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {addWindow(context);},
        child: const Icon(Icons.add),
      ),
    );
  }
}

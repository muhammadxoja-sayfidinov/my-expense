import 'package:flutter/material.dart';

class Model{
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Model(
      {
        required this.id,
        required this.title,
        required this.date,
        required this.amount,
        this.icon = Icons.production_quantity_limits});

}

class  Models{
  final List<Model> _list = [
    Model(id: '1', title: 'Tarvuz', date: DateTime.now(), amount: 20000),
    Model(id: '2', title: 'Cola', date: DateTime.now(), amount: 10000),
    Model(id: '3', title: 'Krasofka', date: DateTime.now(), amount: 200000),
    Model(id: '4', title: 'Flutter darsi', date: DateTime.now(), amount: 500000),
  ];

  List<Model> get list{
    return _list;
  }
  double totalExpenseByMoth(DateTime date){
    final expensesByMoth = sortByMoth(date);
    return expensesByMoth.fold(0, (previousValue, expense) {
      return previousValue + expense.amount;
    });
  }
  List<Model> sortByMoth(DateTime date){
    return _list.where((todo) =>
        todo.date.month == date.month &&
        todo.date.year == date.year ).toList();
  }
  void add ( String title, DateTime date, double amount,IconData icon){
    list.add(
        Model(
            id: '${list.length+1}',
            title: title,
            date: date,
            amount: amount,
            icon: icon
        )

    );
    }
    void delete(String id){
    list.removeWhere((expense) => expense.id == id);
    }

}

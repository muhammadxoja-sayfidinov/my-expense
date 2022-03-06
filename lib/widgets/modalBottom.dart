import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import '/model/expense.dart';

class ModalBottom extends StatefulWidget {
  Function add;
  ModalBottom(this.add);
  @override
  State<ModalBottom> createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  DateTime? markedDayForAdd;

  final _namePlanController = TextEditingController();

  final _namePlanController2 = TextEditingController();

  IconData? _icon;

  void openCalendarForAddPlan(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((selectedDay) {
      if (selectedDay != null) {
        setState(() {
          markedDayForAdd = selectedDay;
        });
      }
      ;
    });
  }

  Future<void> chooseIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);
    setState(() {
      _icon = icon;
    });
  }

  void submit() {
    setState(() {
      if (_namePlanController2.text.isEmpty ||
          _namePlanController2.text.isEmpty ||
          double.parse(_namePlanController2.text) <= 0) {
        return;
      }
      widget.add(_namePlanController.text, markedDayForAdd,
          double.parse(_namePlanController2.text), _icon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
              top: 0,
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom > 0
                  ? MediaQuery.of(context).viewInsets.bottom + 16
                  : MediaQuery.of(context).size.height * 0.25),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      cursorWidth: 0.5,
                      decoration: const InputDecoration(
                        label: Text('Cost name'),
                      ),
                      controller: _namePlanController,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorWidth: 0.5,
                      decoration: const InputDecoration(
                        label: Text('Amount'),
                      ),
                      controller: _namePlanController2,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '''Cost date: ${markedDayForAdd == null ? 'Not selected' : DateFormat('dd MMMM y').format(markedDayForAdd!)}''',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                  TextButton(
                      onPressed: () {
                        openCalendarForAddPlan(context);
                      },
                      child: const Text(
                        'Choose the day',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _icon == null
                      ? const Text('Icon not selected',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal))
                      : Row(
                          children:  [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text('The icon you selected:'),
                            ),
                            Icon(_icon),
                          ],
                        ),
                  TextButton(
                      onPressed: chooseIcon,
                      child: const Text(
                        'Choose icon',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: submit,
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

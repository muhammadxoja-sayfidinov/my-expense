import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {

   final Function showCalendar;
   final DateTime selectDate;
   final Function nextMonth;
   final Function backMonth;
   final double totalByMoth;

   Header(this.showCalendar,this.selectDate,this.nextMonth,this.backMonth,this.totalByMoth,) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          TextButton(
            onPressed: (){showCalendar(context);},
            child:   Text(DateFormat.yMMMM().format(selectDate),style: const TextStyle(fontSize: 20),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed:() => backMonth(),
                    icon:const Icon(Icons.arrow_left,size: 30,color: Colors.blue,)),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(totalByMoth.toStringAsFixed(0),style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                   const Text("so'm",style: TextStyle(fontWeight: FontWeight.bold,height: 0.6),),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed:()=>nextMonth(),
                    icon:const Icon(Icons.arrow_right,size: 30,color: Colors.blue,)),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';


class progres_bar extends StatelessWidget {
  double totalLimetPercentage;
  progres_bar(this.totalLimetPercentage);


  @override
  Widget build(BuildContext context) {
    print(totalLimetPercentage.runtimeType);
    return Container(
      alignment: Alignment.centerLeft,
      height: 5,
      width: double.infinity,
      decoration:  BoxDecoration(
        color:  const Color.fromRGBO(212, 219, 239, 1),
        borderRadius: BorderRadius.circular(20),),
      child: FractionallySizedBox(
          heightFactor: 2,
          widthFactor: totalLimetPercentage/100,
          child: Container(
            height: 10,
            width: 45,
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blue,
                      Colors.blue.shade200,
                      Colors.blue
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
                boxShadow:  const [
                  BoxShadow(
                      color:Colors.blue,
                      spreadRadius: -2,
                      blurRadius: 10

                  ),],
                borderRadius: BorderRadius.circular(20)),

          )),
    );
  }
}

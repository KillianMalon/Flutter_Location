import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/share/location_style.dart';
import 'package:location/share/location_text_style.dart';
import 'package:intl/intl.dart';

class TotalWidget extends StatelessWidget{
  final double total;
  const TotalWidget(this.total, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var format = NumberFormat("###.00€");
    String totalAffiche = format.format(total);
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.grey.shade300,
        border:  Border.all(
          color: LocationStyle.colorPurple,
          width: 2
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 350,
                margin: EdgeInsets.only(left: 12.0),
              child: Text(
                'TOTAL',
                style: LocationTextStyle.subTitleboldTextStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${total.toStringAsFixed(2)} €',
              style: LocationTextStyle.subTitleboldTextStyle,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}

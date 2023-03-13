// ignore_for_file: prefer_const_constructors

import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/models/habitation.dart';
import 'package:location/share/location_style.dart';
import 'package:location/share/location_text_style.dart';
import 'package:location/views/share/total_widget.dart';

class ResaLocation extends StatefulWidget {
  final Habitation _habitation;
  const ResaLocation(this._habitation, {Key? key}) : super(key: key);


  @override
  _ResaLocationState createState() => _ResaLocationState();
}

class _ResaLocationState extends State<ResaLocation> {
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();
  String nbPersonnes = '1';
  List<OptionPayanteCheck> optionPayanteChecks = [];
  String dropdownvalue = "1";
  double prixTotal = 0.0;
  var items = [
    "1","2","3","4","5","6","7","8"
  ];

  // @override
  // void initState() {
  //   dateinput.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  var format = NumberFormat("### €");

  @override
  Widget build(BuildContext context) {
    _loadOptionPayantes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Réservation'),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          _buildResume(),
          _buildDates(),
          _buildNbPersonnes(),
          _buildOptionsPayantes(context),
          TotalWidget(prixTotal),
          _buildRentButton()
        ],
      ),
    );
  }
  _buildResume(){
    return ListTile(
      leading: Icon(Icons.house),
      title: Text(widget._habitation.libelle),
      subtitle: Text(widget._habitation.adresse),
    );
  }

  _buildDates(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              dateTimeRangePicker();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                    Icons.calendar_today_outlined
                ),
                SizedBox(width: 5),
                Text(
                  DateFormat('dd MMM yyyy').format(dateDebut),
                )
              ],
            ),
          ),
          CircleAvatar(
            child: Icon(Icons.arrow_forward_outlined)
          ),
          GestureDetector(
            onTap: () {
              dateTimeRangePicker();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                    Icons.calendar_today_outlined
                ),
                SizedBox(width: 5),
                Text(
                  DateFormat('dd MMM yyyy').format(dateFin),
                )
              ],
            ),
          ),
        ],
      );
  }

  _buildNbPersonnes(){
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Text(
            'Nombre de personnes',
            style: LocationTextStyle.subTitleboldTextStyle,
          ),
          SizedBox(width: 15),
          Container(
            width:50,
            child:
            DropdownButton<String>(
              isExpanded: true,
              value: dropdownvalue,
              items: _buildDropDownItem(items),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              }, // isExpanded: true,
            ),
          ),
        ],
      ),
    );
  }
  _loadOptionPayantes(){
    if (optionPayanteChecks.isEmpty){
      for(var element in widget._habitation.optionsPayantes){
        var checkTakeOption = false;
        OptionPayanteCheck optionPayante = OptionPayanteCheck(element.id, element.libelle, checkTakeOption, description: element.description, prix: element.prix);
        optionPayanteChecks.add(optionPayante);
      }
      prixTotal = widget._habitation.prixomis;
    }
  }

  _buildOptionsPayantes(BuildContext context){
    var format = NumberFormat("### €");
    // var width = (MediaQuery.of(context).size.width / 2) -15;

    return Wrap(
      children:
      Iterable.generate(
        optionPayanteChecks.length,
            (i) => Expanded(
                child:
                CheckboxListTile(
                  value: optionPayanteChecks[i].checked,
                  selected: optionPayanteChecks[i].checked,
                  onChanged: (value) => setState(() {
                    optionPayanteChecks[i].checked = value!;
                    value
                        ? prixTotal += optionPayanteChecks[i].prix
                        : prixTotal -= optionPayanteChecks[i].prix;
                  }),
                  secondary: const Icon(Icons.shopping_cart),
                  title: Text(optionPayanteChecks[i].libelle + "  (${format.format(optionPayanteChecks[i].prix)} )",
                      style: LocationTextStyle.boldTextStyle),
                  subtitle: Text(optionPayanteChecks[i].description,
                      style: LocationTextStyle.regularGreyTextStyle),
                ),
              ),
      ).toList(),
    );
  }

  _buildDropDownItem(List<String> list){
    return Iterable.generate(
      list.length,
          (i) => DropdownMenuItem<String>(
            value: list[i],
            child: Text(list[i]),
      ),
    ).toList();
  }

  _buildRentButton() {
    return Container(
      height: 45,
        margin: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            onPressed: () {
              print('Location init : $nbPersonnes');
            },
            child: Text( 'Louer', style: LocationTextStyle.priceTextStyle),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff353672)),
            ),
        ));
  }


  dateTimeRangePicker() async {
    DateTimeRange? datePicked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      initialDateRange: DateTimeRange(start: dateDebut, end: dateFin),
      cancelText: 'Annuler',
      confirmText: 'Valider',
      locale: const Locale("fr", "FR"),
    );
    if (datePicked != null) {
      setState(() {
        dateDebut = datePicked.start;
        dateFin = datePicked.end;
      });
    }
  }
}
class OptionPayanteCheck extends OptionPayante{
  bool checked;

  OptionPayanteCheck(super.id, super.libelle, this.checked,{super.description = "", super.prix});
}

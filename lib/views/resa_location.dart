import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/colors.dart';
import 'package:location/models/habitation.dart';

class ResaLocation extends StatefulWidget {
  const ResaLocation({super.key});

  @override
  State<ResaLocation> createState() => _ResaLocationState();
}

class OptionPayanteCheck extends OptionPayante {
  bool checked;

  OptionPayanteCheck(super.id, super.libelle, this.checked,
      {super.description = "", super.prix});
}

class _ResaLocationState extends State<ResaLocation> {
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();
  String nbPersonnes = '1';
  List<OptionPayanteCheck> optionPayanteChecks = [];

  var format = NumberFormat('### €');

  @override
  Widget build(BuildContext context) {
    // _loadOptionPayantes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          // _buildResume(),
          _buildDates(),
          _buildNbPersonnes(),
          // _buildOptionsPayantes(context),
          TotalWidget(
            prixTotal: 600,
          ),
          // _buildRentButton(),
        ],
      ),
    );
  }

  // _loadOptionPayantes() {
  // }

  // _buildResume() {
  // }

  _buildDates() {
    return Center(
      child: GestureDetector(
        onTap: () => dateTimeRangePicker(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: darkBlue,
                ),
                SizedBox(width: 8.0),
                Text(
                  '${_formatDate(dateDebut)}',
                  style: TextStyle(color: darkBlue),
                ),
              ],
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: darkBlue,
              child: Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: darkBlue,
                ),
                SizedBox(width: 8.0),
                Text(
                  '${_formatDate(dateFin)}',
                  style: TextStyle(color: darkBlue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy', 'fr_FR').format(date);
  }

  dateTimeRangePicker() async {
    DateTimeRange? datePicked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      initialDateRange: DateTimeRange(start: dateDebut, end: dateFin),
      cancelText: 'Annuler',
      confirmText: 'Valider',
      locale: const Locale('fr', 'FR'),
    );
    if (datePicked != null) {
      setState(() {
        dateDebut = datePicked.start;
        dateFin = datePicked.end;
      });
    }
  }

  _buildNbPersonnes() {
    List<int> nbPersonnesList = List.generate(8, (index) => index + 1);

    int selectedNbPersonnes = 1;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text('Nombre de personnes'),
          SizedBox(width: 10),
          DropdownButton<int>(
            value: selectedNbPersonnes,
            onChanged: (value) {
              print('Selected Number of Persons: $value');
              if (value != null) {
                selectedNbPersonnes = value;
              }
            },
            items: nbPersonnesList.map((int nbPersonnes) {
              return DropdownMenuItem<int>(
                value: nbPersonnes,
                child: Text('$nbPersonnes'),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // _buildOptionsPayantes(BuildContext context) {
  // }

  // _buildRentButton() {
  // }
}

class TotalWidget extends StatelessWidget {
  final double prixTotal;

  TotalWidget({required this.prixTotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: darkBlue, width: 2.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'TOTAL',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
            ),
          ),
          Text(
            '${prixTotal.toStringAsFixed(2)} €',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime currentDate = DateTime.now();
int currentYear = currentDate.year;

DateTime? to_date;
DateTime? form_date;
int month = DateTime.now().month;

void getMonth() {
  if (month <= 3) {
    to_date = DateTime(currentYear - 1, 3, 31);
    form_date = to_date!.add(Duration(days: 365)).add(Duration(days: 2));
    log(to_date.toString());
    log(form_date.toString());
  } else {
    to_date = DateTime(currentYear, 3, 31);
    // Set fromDate to toDate of current year minus one year, and subtract one day
    form_date =
        to_date!.subtract(Duration(days: 365)).subtract(Duration(days: 1));
  }
}

List filer = [];

List year = ['2022', '2021', '2020', '2019'];

class ExtraFile extends StatefulWidget {
  const ExtraFile({super.key});

  @override
  State<ExtraFile> createState() => _ExtraFileState();
}

String formatted = '', formattedFROM = '';

class _ExtraFileState extends State<ExtraFile> {
  @override
  void initState() {
    // final String pattern = 'yyyy-MM-dd';
    // formatted = DateFormat(pattern).format(to_date!);
    // formattedFROM = DateFormat(pattern).format(form_date!);

    to_date = DateTime(currentYear, 3, 31);
    // Set fromDate to toDate of current year minus one year, and subtract one day
    form_date =
        to_date!.subtract(Duration(days: 365)).subtract(Duration(days: 1));

    log(to_date.toString());
    log(form_date.toString());

    // getMonth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              Text("${formatted} ${formattedFROM}"),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: year.length,
            itemBuilder: (context, index) => Column(
              children: [Text("${year[index]}")],
            ),
          ))
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:homebase_app/screens/component/reuse_row.dart';

class DetailsScren extends StatefulWidget {
  String knowName;
  String awardYear;
  String category;
  String categoryName;
  String awardDate;
  String priceAmount;
  String priceAdjust;
  String motivations;
  DetailsScren({
    super.key,
    required this.knowName,
    required this.awardYear,
    required this.category,
    required this.categoryName,
    required this.awardDate,
    required this.priceAmount,
    required this.priceAdjust,
    required this.motivations,
  });

  @override
  State<DetailsScren> createState() => _DetailsScrenState();
}

class _DetailsScrenState extends State<DetailsScren> {
  @override
  Widget build(BuildContext context) {
    final scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nobel Prize Details',
          style: TextStyle(color: Colors.black, letterSpacing: 0.4),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade200,
      ),
      backgroundColor: Colors.yellow.shade50,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: scrHeight * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amberAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 80,
                    ),
                    Text(
                      widget.knowName,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Reuseable(
              icons: Icons.date_range,
              title: 'Award Years: ',
              descp: widget.awardYear,
            ),
            const Spacer(),
            Reuseable(
              icons: Icons.category,
              title: 'Category: ',
              descp: widget.category,
            ),
            const Spacer(),
            Reuseable(
              icons: Icons.title,
              title: 'Category Full Name: ',
              descp: widget.categoryName,
            ),
            const Spacer(),
            Reuseable(
              icons: Icons.calendar_today_rounded,
              title: 'Date Awarded: ',
              descp: widget.awardDate,
            ),
            const Spacer(),
            Reuseable(
              icons: Icons.attach_money_outlined,
              title: 'Price Amount: ',
              descp: widget.priceAmount,
            ),
            const Spacer(),
            Reuseable(
              icons: Icons.attach_money,
              title: 'Price Amount Adjusted: ',
              descp: widget.priceAdjust,
            ),
            const Spacer(),
            const Row(
              children: [
                Icon(
                  Icons.message,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Motivation For Award: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                widget.motivations,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}

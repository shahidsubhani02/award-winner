import 'package:flutter/material.dart';
import 'package:homebase_app/api/model_api.dart';
import 'package:homebase_app/model/prize_model.dart';
import 'package:homebase_app/screens/details_srn.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nobel Prizes',
          style: TextStyle(color: Colors.black, letterSpacing: 0.4),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade200,
      ),
      backgroundColor: Colors.amber.shade50,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [nobel_prize()],
        ),
      ),
    );
  }

  Expanded nobel_prize() {
    return Expanded(
        child: FutureBuilder<PrizeModel>(
      future: getPrizeApi(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 243, 218, 130),
            highlightColor: const Color.fromARGB(255, 189, 167, 100),
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      height: MediaQuery.of(context).size.height * 0.025,
                      width: MediaQuery.of(context).size.width * 0.12,
                      color: Colors.white,
                    ),
                    subtitle: Container(
                      height: MediaQuery.of(context).size.height * 0.025,
                      width: MediaQuery.of(context).size.width * 0.12,
                      color: Colors.white,
                    ),
                    leading: Container(
                      height: MediaQuery.of(context).size.height * 0.025,
                      width: MediaQuery.of(context).size.width * 0.12,
                      color: Colors.white,
                    ),
                  );
                }),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.nobelPrizes!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScren(
                            knowName: snapshot.data!.nobelPrizes![index]
                                .laureates![index - index].knownName
                                .toString(),
                            awardYear: snapshot
                                .data!.nobelPrizes![index].awardYear
                                .toString(),
                            category: snapshot
                                .data!.nobelPrizes![index].category
                                .toString(),
                            categoryName: snapshot
                                .data!.nobelPrizes![index].categoryFullName
                                .toString(),
                            awardDate: snapshot
                                .data!.nobelPrizes![index].dateAwarded
                                .toString(),
                            priceAmount: snapshot
                                .data!.nobelPrizes![index].prizeAmount
                                .toString(),
                            priceAdjust: snapshot
                                .data!.nobelPrizes![index].prizeAmountAdjusted
                                .toString(),
                            motivations: snapshot.data!.nobelPrizes![index]
                                .laureates![index - index].motivation
                                .toString(),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.yellow.shade50,
                      shadowColor: Color.fromARGB(255, 238, 191, 51),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${snapshot.data!.nobelPrizes![index].awardYear} - ${snapshot.data!.nobelPrizes![index].category}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_right_sharp,
                                  size: 30,
                                )
                              ],
                            ),
                            Text(
                              'Date Awarded: ${snapshot.data!.nobelPrizes![index].dateAwarded}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Laureates: ${snapshot.data!.nobelPrizes![index].laureates![index - index].knownName}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Motivation: ${snapshot.data!.nobelPrizes![index].laureates![index - index].motivation}',
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
      },
    ));
  }
}

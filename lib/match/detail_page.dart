// Nama : Fadhlan Hisyam
// NIM  : 124200022
// Plug : A

import 'package:flutter/material.dart';
import 'package:responsi_124200022/helper/base_network.dart';
import 'package:responsi_124200022/model/detail_matches_model.dart';
import 'package:responsi_124200022/model/matches_model.dart';

class MatchDetail extends StatefulWidget {
  final MatchesModel? detail;
  const MatchDetail({Key? key, required this.detail}) : super(key: key);

  @override
  State<MatchDetail> createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Match ID : ${widget.detail?.id}",
                  style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Text(
                  '${widget.detail?.homeTeam!.name} vs ${widget.detail?.awayTeam!.name}',
                  style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold
                  ),
                  )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: BaseNetwork.get("matches/${widget.detail?.id}"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingSection();
            } else if (snapshot.hasError) {
              debugPrint(snapshot.toString());
              return _buildErrorSection();
            } else if (snapshot.hasData) {
              DetailMatchesModel matchModel = DetailMatchesModel.fromJson(snapshot.data);
              return _buildSuccessSection(matchModel);
            } else {
              return _buildErrorSection();
            }
          },
        ),
      ),
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(DetailMatchesModel data) {
    HomeTeamDetail? home = data.homeTeam!;
    AwayTeamDetail? away = data.awayTeam!;
    Statistics? homeStats = home.statistics!;
    Statistics? awayStats = away.statistics!;
    int ballPossHome = (homeStats.ballPossession!.round());
    int ballPossAway = (awayStats.ballPossession!.round());
    int passAccHome = ((homeStats.passesCompleted!.toDouble() /
        homeStats.passes!.toDouble()) * 100).round();
    int passAccAway = ((awayStats.passesCompleted!.toDouble() /
        awayStats.passes!.toDouble()) * 100).round();


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 150,
                        height: 120,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                                'https://countryflagsapi.com/png/${widget.detail!
                                    .homeTeam!.name!}'))),
                    Padding(padding: const EdgeInsets.all(8)),
                    Text(("${widget.detail!.homeTeam!.name!}")),
                  ],

                ),
                Text(
                  " ${widget.detail!.homeTeam!.goals} - ${widget.detail!.awayTeam!
                      .goals} ",
                  style: const TextStyle(
                      fontSize: 20
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 150,
                        height: 120,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                                'https://countryflagsapi.com/png/${widget.detail!
                                    .awayTeam!.name!}'))),
                    Padding(padding: const EdgeInsets.all(8)),
                    Text(("${widget.detail!.awayTeam!.name!}")),
                  ],

                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
                "Stadium : ${data.venue}"
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
                "Stadium : ${data.location}"
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Container(
              padding: const EdgeInsets.all(16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // if you need this
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.1),
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Statistics", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$ballPossHome%"),
                          Text("Ball Possession"),
                          Text("$ballPossAway%"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${homeStats!.attemptsOnGoal}"),
                          Text("Shots"),
                          Text("${awayStats!.attemptsOnGoal}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${homeStats!.kicksOnTarget}"),
                          Text("Shots on Goal"),
                          Text("${awayStats!.kicksOnTarget}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${homeStats!.corners}"),
                          Text("Corners"),
                          Text("${awayStats!.corners}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${homeStats!.offsides}"),
                          Text("Offsides"),
                          Text("${awayStats!.offsides}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${homeStats!.foulsCommited}"),
                          Text("Fouls Committed"),
                          Text("${awayStats!.foulsCommited}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$passAccHome%"),
                          Text("Pass Accuracy"),
                          Text("$passAccAway%")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            const Text("Referees :", style: TextStyle(fontSize: 20)),
            const Padding(padding: EdgeInsets.only(top: 8)),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data.officials!.map((ofc) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 200,
                        width: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // if you need this
                            side: BorderSide(
                              color: Colors.black.withOpacity(0.1),
                              width: 3,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 80,
                                  child: const Image(
                                    image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/5/5c/FIFA_series_logo.png'),
                                  ),
                                ),
                                Text(
                                  "${ofc.name}",
                                  textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "(${ofc.role})",
                                  textAlign: TextAlign.center,style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  }).toList(),
                )
            )
          ],
        ),
      ),
    );
  }
}
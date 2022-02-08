import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../dataprovider.dart';

class GameScreen extends StatefulWidget {
  TabController tabController;

  GameScreen({Key? key, required this.tabController}) : super(key: key);
  //  TabController tabController = tabController;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List chair = [];

  @override
  void initState() {
    final int part = Provider.of<Datap>(context, listen: false).count;
    final int skip = Provider.of<Datap>(context, listen: false).skip;
    // TODO: implement initState
    for (var i = 1; i <= part; i++) {
      chair.add(i);
    }
    print(chair);
    print(part);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int part = Provider.of<Datap>(context, listen: false).count;
    final int skip = Provider.of<Datap>(context, listen: false).skip;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Press icon to tart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow_outlined),
            tooltip: 'press to start',
            onPressed: () {
              Timer.periodic(const Duration(milliseconds: 500), (timer) {
                delete(lastSurvivor(part, skip));
              });
              Timer(Duration(milliseconds: 350 * chair.length),
                  () {
                // delete(lastSurvivor(part, skip));
                showAlertDialog(context, chair.last);
              });

              //
              //delete(lastSurvivor(widget.part, widget.skip));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                crossAxisCount: 8,
                children: List.generate(
                  // (widget.part-x+1)-(widget.part-x),
                  chair.length,
                  (int index) {
                    // return Card(
                    //   color: Colors.blue,
                    //   child: Center(child: Text('${chair[index]}')),
                    // );
                    return AnimationConfiguration.staggeredGrid(
                      //columnCount: columnCount,
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 8,
                      child: ScaleAnimation(
                        scale: 0.5,
                        child: FadeInAnimation(
                          child: Card(
                            color: Colors.primaries[
                                    chair.indexWhere((e) => e == chair[index]) %
                                        Colors.primaries.length]
                                .withOpacity(0.3),
                            child: Center(child: Text('${chair[index]}')),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Timer.periodic(Duration(milliseconds: 500 * chair.length),
          //     (timer) {
          //   // delete(lastSurvivor(part, skip));
          //   showAlertDialog(context, chair[0]);
          // });
        ],
      ),
    );
  }

  void delete(int index) {
    setState(() {
      chair.removeAt(index);
      print("tile number#$index is deleted");
      // print(chair[chair.length-1]);
    });
  }

  lastSurvivor(chairs, skip) {
    skip++;
    print(chairs);

    if (chairs == 1) {
      return 1;
    } else {
      return ((lastSurvivor(chairs - 1, skip) + skip - 1) % chairs) + 1;
    }
  }

  showAlertDialog(BuildContext context, int x) {
    // set up the buttons

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      actions: [
        Center(
          child: Column(
            children: [
              Container(
                child: Text(
                  "Last survivor is : $x",
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.tabController
                        .animateTo(0, duration: Duration(seconds: 1));
                   // Navigator.of(context).pop();
                  },
                  child: Text("0k"))
            ],
          ),
        ),
        // continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

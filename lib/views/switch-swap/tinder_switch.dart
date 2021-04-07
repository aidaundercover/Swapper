import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/models/swap_stuff.dart';
import 'package:swapper/widgets/bottom_buttons_widget.dart';
import 'package:swapper/views/switch-swap/switch_swap.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class TinderStuff extends StatefulWidget {
  @override
  _TinderStuffState createState() => _TinderStuffState();
}

class _TinderStuffState extends State<TinderStuff>
    with TickerProviderStateMixin {
  CardController controller;

  List<UserStuff> users = [];
  int itemLength = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      users = dummyStuff;
      itemLength = dummyStuff.length;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: greenWhite,
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              users.isEmpty ? Text('No more swaps') : getBody(),
              Expanded(child: Container()),
            ],
          ),
        ),
        bottomSheet: BottomButtonsWidget(),
      );

  Widget buildAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_outlined, color: Colors.grey, size: 40),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SwitchSwap())),
        ),
        title: Text(
          'DISCOVER',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'Arial',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      );

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Container(
        color: white,
        child: TinderSwapCard(
          totalNum: itemLength,
          maxWidth: size.width / 1.09,
          maxHeight: 510,
          minWidth: size.width / 1.12,
          minHeight: 500,
          cardBuilder: (context, index) => 
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(users[index].imgUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.25),
                          Colors.black.withOpacity(0),
                        ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.72,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          users[index].username.toString(),
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          users[index].location.toString(),
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: green,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Recently Active",
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: List.generate(
                                          users[index].preferedSwaps.length,
                                          (indexLikes) {
                                        if (indexLikes == 0) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: white, width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color:
                                                      white.withOpacity(0.4)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3,
                                                    bottom: 3,
                                                    left: 10,
                                                    right: 10),
                                                child: Text(
                                                  users[index].preferedSwaps[
                                                      indexLikes].toString(),
                                                  style:
                                                      TextStyle(color: white),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: white.withOpacity(0.2)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3,
                                                  bottom: 3,
                                                  left: 10,
                                                  right: 10),
                                              child: Text(
                                                users[index]
                                                    .preferedSwaps[indexLikes].toString(),
                                                style: TextStyle(color: white),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: size.width * 0.2,
                                  child: Center(
                                    child: Icon(
                                      Icons.info,
                                      color: white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          cardController: controller = CardController(),
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping
            }
            // print(itemsTemp.length);
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            /// Get orientation & index of swiped card!
            if (index == (users.length - 1)) {
              setState(() {
                itemLength = users.length - 1;
              });
            }
          },
        ),
    );
  }
}

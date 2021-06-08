import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:swapper/models/chats.dart';
import 'package:swapper/views/chat/personalchat.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: green,
        centerTitle: true,
        title: Text('Chats',
            style: TextStyle(
                fontSize: 19,
                color: white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial')),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    bool messagesPressed = true;
    bool matchesPressed = false;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Text(
                  "Messages",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: messagesPressed
                          ? green
                          : Colors.black.withOpacity(0.5),
                      fontFamily: 'Arial'),
                ),
                onTap: () => {
                  setState(() {
                    messagesPressed = !messagesPressed;
                  })
                },
              ),
              Container(
                height: 25,
                width: 1,
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.15)),
              ),
              InkWell(
                child: Text(
                  "Matches",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      color: matchesPressed
                          ? green
                          : Colors.black.withOpacity(0.5)),
                ),
                onTap: () {
                  setState(() {
                  matchesPressed = !matchesPressed;
                  print(matchesPressed);       
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 0.8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 0, right: 8),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              cursorColor: Colors.black.withOpacity(0.5),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  hintText: "Search 0 Matches"),
            ),
          ),
        ),
        Divider(
          thickness: 0.8,
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "New Matches",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500, color: green),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                    children: List.generate(chats_json.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                        
                          child: Container(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: <Widget>[
                                chats_json[index]['story']
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: green, width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        chats_json[index]['img']),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    chats_json[index]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                chats_json[index]['online']
                                    ? Positioned(
                                        top: 48,
                                        left: 52,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: green,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: white, width: 3)),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 70,
                          child: Align(
                              child: Text(
                            chats_json[index]['name'],
                            overflow: TextOverflow.ellipsis,
                          )),
                        )
                      ],
                    ),
                  );
                })),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: List.generate(userMessages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: <Widget>[
                              userMessages[index]['story']
                                  ? Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: green, width: 3)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      userMessages[index]
                                                          ['img']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 65,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  userMessages[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                              userMessages[index]['online']
                                  ? Positioned(
                                      top: 48,
                                      left: 52,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: white, width: 3)),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalChat()));
                              },
                              child: Text(
                                userMessages[index]['name'],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 135,
                              child: Text(
                                userMessages[index]['message'] +
                                    " - " +
                                    userMessages[index]['created_at'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.8)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        )
      ],
    );
  }
}

import 'package:chat_messanger_ui/constant/data.dart';
import 'package:chat_messanger_ui/pages/chat_detail_page.dart';
import 'package:chat_messanger_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(MdiIcons.chat),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Stack(children: <Widget>[
        Icon(Icons.people),
        Positioned(
          right: 0.0,
          left: 5,
          // draw a red marble
          child: Container(
            height: 25,
            width: 25,
            decoration:
                BoxDecoration(color: Colors.grey[800], shape: BoxShape.circle),
            child: Center(
              child: Text(
                '36',
                style: TextStyle(
                    fontSize: 14, color: online, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]),
      label: 'People',
    ),
  ];

  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: black,
        items: items,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Chats",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[800], shape: BoxShape.circle),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[800], shape: BoxShape.circle),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(25)),
          child: TextField(
            cursorColor: black,
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  LineIcons.search,
                  color: white.withOpacity(0.5),
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                    fontSize: 18.0, color: Colors.white.withOpacity(0.5)),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[800]),
                      child: Center(
                        child: Icon(
                          Icons.video_call,
                          color: Colors.white,
                          size: 33,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: Align(
                          child: Text(
                        'Create\nRoom',
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      )),
                    )
                  ],
                ),
              ),
              Row(
                  children: List.generate(userStories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 75,
                        height: 75,
                        child: Stack(
                          children: <Widget>[
                            userStories[index]['story']
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    userStories[index]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                userStories[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                            userStories[index]['online']
                                ? Positioned(
                                    top: 48,
                                    left: 52,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: online,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black, width: 3)),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 75,
                        child: Align(
                            child: Text(
                          userStories[index]['name'],
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        )),
                      )
                    ],
                  ),
                );
              }))
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: List.generate(userMessages.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ChatDetailPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 75,
                      height: 75,
                      child: Stack(
                        children: <Widget>[
                          userMessages[index]['story']
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: blue_story, width: 3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  userMessages[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
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
                                        color: online,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 3)),
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
                        Text(
                          userMessages[index]['name'],
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 165,
                          child: Text(
                            userMessages[index]['message'] +
                                " - " +
                                userMessages[index]['created_at'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    ));
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/headerwithmenu.dart';
import 'package:virtualbuild/models/chat_users.dart';
import '../../widgets/chats/chatlist.dart';
import '../../widgets/customdecorationforinput.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});
  static const routeName = "/chats";

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Arya Rajiv Kiran Dessai Gaonkar",
        message:
            "I have some particular plans about building my new house, i would like to hear your thoughts regarding the same ",
        imageURL: "assets/Female.png",
        time: "3:00 pm",
        unreadCount: 4,
        isRead: true),
    ChatUsers(
        name: "Vijay Pai",
        message: "i told you about it",
        imageURL: "assets/Male.png",
        time: "12:00 am",
        unreadCount: 2,
        isRead: false),
    ChatUsers(
        name: "Jiya Gaonkar",
        message: "yes, i saw you yesterday",
        imageURL: "assets/Female.png",
        time: "Yesterday",
        unreadCount: 0,
        isRead: false),
    ChatUsers(
        name: "Arun Pai",
        message: "ok, will start with project soon",
        imageURL: "assets/Male.png",
        time: "Dec 6",
        unreadCount: 0,
        isRead: true),
    ChatUsers(
        name: "Siya Gaonkar",
        message: "no idea about that",
        imageURL: "assets/Female.png",
        time: "Nov 19",
        unreadCount: 0,
        isRead: true),
    ChatUsers(
        name: "Laksh Pai",
        message: "its been a while",
        imageURL: "assets/Male.png",
        time: "Nov 15",
        unreadCount: 0,
        isRead: false),
    ChatUsers(
        name: "Aradhya Gaonkar",
        message: "starting with the work",
        imageURL: "assets/Female.png",
        time: "Oct 13",
        unreadCount: 0,
        isRead: false),
    ChatUsers(
        name: "Jai Pai",
        message: "Thank you,",
        imageURL: "assets/Male.png",
        time: "April 4",
        unreadCount: 0,
        isRead: false),
    ChatUsers(
        name: "Risha Gaonkar",
        message: "can we schedule a meet today evening?",
        imageURL: "assets/Female.png",
        time: "Jan 3",
        unreadCount: 0,
        isRead: true),
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomMenu(),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MyCustomScreen(
          // customColor: Colors.blue,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWithMenu(
                header: "My Chats",
                scaffoldKey: scaffoldKey,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                controller: _searchTextController,
                decoration: customDecorationForInput(
                  context,
                  "Search...",
                  Icons.search_outlined,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: chatUsers.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  itemBuilder: (context, index) {
                    return ChatList(
                      name: chatUsers[index].name,
                      message: chatUsers[index].message,
                      imageUrl: chatUsers[index].imageURL,
                      time: chatUsers[index].time,
                      unreadCount: chatUsers[index].unreadCount,
                      isRead: (index == 0 || index == 3) ? true : false,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

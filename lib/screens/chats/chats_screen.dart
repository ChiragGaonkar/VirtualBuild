import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/providers/chatsprovider.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/headerwithmenu.dart';
import '../../widgets/chats/chatlist.dart';
import '../../widgets/customdecorationforinput.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});
  static const routeName = "/chats";

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final chatsArchitectsList =
        Provider.of<ChatsProvider>(context, listen: false).getArchitectsList;
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
                  itemCount: chatsArchitectsList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  itemBuilder: (context, index) {
                    return ChatList(
                      name: chatsArchitectsList[index].name,
                      message: chatsArchitectsList[index].message,
                      imageUrl: chatsArchitectsList[index].imageURL,
                      time: chatsArchitectsList[index].time,
                      unreadCount: chatsArchitectsList[index].unreadCount,
                      chatsId: chatsArchitectsList[index].chatId,
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

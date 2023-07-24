import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/providers/chatsprovider.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/data_not_found.dart';
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
    final chatsArchitectsList = Provider.of<ChatsProvider>(context, listen: false);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
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
                onChanged: (value) {
                  setState(() {}); // Triggers a rebuild to update the stream
                },
                decoration: customDecorationForInput(
                  context,
                  "Search...",
                  Icons.search_outlined,
                ),
              ),
              FutureBuilder(
                // future: chatsArchitectsList.getMessagedArchitectsDetails(),
                future: _searchTextController.text.isNotEmpty ? chatsArchitectsList.searchMessagedArchitects(_searchTextController.text) : chatsArchitectsList.getMessagedArchitectsDetails(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CustomLoadingSpinner());
                  } else if (snapshot.data!.isEmpty) {
                    return const Center(child: DataNotFound());
                  }
                  return Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    itemBuilder: (context, index) {
                      return ChatList(
                        name: snapshot.data![index].name,
                        message: snapshot.data![index].message,
                        imageUrl: snapshot.data![index].imageURL,
                        time: snapshot.data![index].time,
                        unreadCount: snapshot.data![index].unreadCount,
                        chatsId: snapshot.data![index].chatId,
                        isRead: (index == 0 || index == 3) ? true : false,
                      );
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

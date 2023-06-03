import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/models/chats_model.dart';
import 'package:virtualbuild/providers/chatsprovider.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
import 'package:virtualbuild/widgets/headerwithphoto.dart';
import '../../widgets/customscreen.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../widgets/data_not_found.dart';
import 'chats_screen.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail({super.key});
  static const routeName = "/chatdetail";

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  late ChatsProvider chatsProvider;
  final _messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatsProvider = context.read<ChatsProvider>();
  }

  validateAndSendMessage(
      String message, bool read, Sender sender, String architectId) {
    if (message.trim().isNotEmpty) {
      _messageTextController.clear();
      chatsProvider.sendMessage(
        message,
        true,
        sender,
        architectId,
      );
    }
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MyCustomScreen(
          // leftPadding: 0,
          // rightPadding: 0,
          screenContent: Stack(
            children: [
              HeaderWithPhoto(
                heading: args['name'],
                screenToBeRendered: ChatsScreen.routeName,
                imageURL: args['imageUrl'],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: SizedBox(
                  height: size.height * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: StreamBuilder(
                      stream: chatsProvider
                          .getChatStream(args['uid'] + args['aid']),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const CustomLoadingSpinner();
                        } else if (snapshot.data!.docs.isEmpty) {
                          return const Center(child: DataNotFound());
                        } else {
                          var listMessage = snapshot.data?.docs;
                          return ListView.builder(
                            itemCount: listMessage?.length,
                            controller: _scrollController,
                            //shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final message = listMessage?[index]['message'];
                              final sender = listMessage?[index]['sender'];
                              final time = listMessage?[index]['time'];
                              final read = listMessage?[index]['read'];
                              return Container(
                                // padding: const EdgeInsets.only(
                                //left: 14, right: 14, top: 10, bottom: 10),
                                padding: sender == "architect"
                                    ? const EdgeInsets.only(
                                        left: 0,
                                        right: 25,
                                        top: 10,
                                        bottom: 10,
                                      )
                                    : const EdgeInsets.only(
                                        left: 25,
                                        right: 0,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: (sender == "architect"
                                          ? Alignment.topLeft
                                          : Alignment.topRight),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: (sender == "architect"
                                              ? Theme.of(context).canvasColor
                                              : Theme.of(context).primaryColor),
                                        ),
                                        //padding: const EdgeInsets.all(16),
                                        child: Stack(
                                          //mainAxisSize: MainAxisSize.min,
                                          //crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 80,
                                                top: 16,
                                                bottom: 25,
                                              ),
                                              //Flexible(
                                              child: Text(
                                                message,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 5,
                                              right: 10,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    timeago.format(
                                                        time.toDate(),
                                                        locale: 'en_short'),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .secondaryHeaderColor),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  const Icon(
                                                    Icons.done_all,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).canvasColor.withOpacity(1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _messageTextController,
                            decoration: const InputDecoration(
                              hintText: "Type a message.",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Theme.of(context).secondaryHeaderColor,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            validateAndSendMessage(
                              _messageTextController.text,
                              true,
                              Sender.user,
                              args['aid'],
                            );
                            Future.delayed(const Duration(milliseconds: 50))
                                .then((_) => _scrollDown());
                          },
                          icon: Icon(
                            Icons.send,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

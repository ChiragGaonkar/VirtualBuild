import 'package:flutter/material.dart';
import 'package:virtualbuild/models/chat_message.dart';
import 'package:virtualbuild/widgets/headerwithphoto.dart';
import '../../widgets/customscreen.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail({super.key});
  static const routeName = "/chatdetail";

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  List<ChatMessage> messages = [
    ChatMessage(message: "Hello, Aryan", messenger: "receiver"),
    ChatMessage(message: "How have you been?", messenger: "receiver"),
    ChatMessage(message: "I am fine. wbu?", messenger: "sender"),
    ChatMessage(message: "I am good.", messenger: "receiver"),
    ChatMessage(message: "And hows life going on", messenger: "sender"),
    ChatMessage(
        message: "good jhukju ujhhlohjlohlohjlo hghjfvghfvu hjhgb",
        messenger: "receiver"),
    ChatMessage(
        message:
            "qwertyuio qwrertyui asdfghj cvbnm sfddghfjf ghgk jkl asaadasasasa 7877096754 qwertyqwertyqwerty",
        messenger: "sender"),
    ChatMessage(message: "good", messenger: "receiver"),
    ChatMessage(message: "good", messenger: "receiver"),
    ChatMessage(message: "good", messenger: "receiver"),
    ChatMessage(message: "good", messenger: "receiver"),
  ];

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
          leftPadding: 0,
          rightPadding: 0,
          screenContent: Stack(
            children: [
              HeaderWithPhoto(
                heading: args['name'],
                screenToBeRendered: "None",
                imageURL: args['imageUrl'],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: SizedBox(
                  height: size.height * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView.builder(
                      itemCount: messages.length,
                      //shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          // padding: const EdgeInsets.only(
                          //left: 14, right: 14, top: 10, bottom: 10),
                          padding: messages[index].messenger == "receiver"
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
                          child: Align(
                            alignment: (messages[index].messenger == "receiver"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (messages[index].messenger == "receiver"
                                    ? Theme.of(context).canvasColor
                                    : Theme.of(context).primaryColor),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                messages[index].message,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        );
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
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
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
                          onPressed: () {},
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
}

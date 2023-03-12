import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/chats/chat_message.dart';

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
    return Scaffold(
      // body: MyCustomScreen(
      // screenContent: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Header(heading: "Create an Account"),
      //         SizedBox(
      //           height: size.height * 0.05,
      //         ),
      //     ]
      // )
      // )
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/Female.png"),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Arya Gaonkar",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 45,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                // padding: const EdgeInsets.only(
                //left: 14, right: 14, top: 10, bottom: 10),
                padding: messages[index].messenger == "receiver"
                    ? EdgeInsets.only(left: 0, right: 25, top: 10, bottom: 10)
                    : EdgeInsets.only(left: 25, right: 0, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messenger == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messenger == "receiver"
                          ? Colors.grey[800]
                          : Colors.orange[900]),
                    ),
                    padding: const EdgeInsets.all(16),

                    /*child: 
                        Text(
                          messages[index].message,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white,
                              ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "20:58",
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                            const Icon(
                              Icons.done_all,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                
                    ),
                  ),
                ),
              );
            },*/
                    child: Text(
                      messages[index].message,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.grey[800],
              child: Row(
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     decoration: BoxDecoration(
                  //       color: Colors.lightBlue,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     // child: const Icon(
                  //     //   Icons.add,
                  //     //   color: Colors.white,
                  //     //   size: 20,
                  //     // ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type a message.",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey[800],
                    elevation: 0,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey[800],
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

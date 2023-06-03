import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:virtualbuild/models/bot_chats_model.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithmenu.dart';
import '../../widgets/botarchitect/chat_message.dart';
import '../../widgets/custommenu.dart';
import 'package:http/http.dart' as http;
import '../../widgets/data_not_found.dart';
import 'bot_constants.dart';

class ChatWithBotScreen extends StatefulWidget {
  const ChatWithBotScreen({super.key});
  static const routeName = '/chatbot';
  @override
  State<ChatWithBotScreen> createState() => _ChatWithBotScreenState();
}

class _ChatWithBotScreenState extends State<ChatWithBotScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<String> generateResponse(String prompt) async {
    const String apiKey = apiKeyConstant;
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": prompt,
        "temperature": 0,
        "max_tokens": 200,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
      }),
    );

    if (response.statusCode != 200) {
      print('Error: ${response.statusCode}');
      print(response.body);
      return ''; // or throw an exception
    }

    Map<String, dynamic> decodedResponse = json.decode(response.body);

    if (!decodedResponse.containsKey('choices') ||
        decodedResponse['choices'].isEmpty ||
        !decodedResponse['choices'][0].containsKey('text')) {
      print('Error: unexpected response structure');
      print(decodedResponse);
      return ''; // or throw an exception
    }

    return decodedResponse['choices'][0]['text'];
  }

  final _questionTextController = TextEditingController();
  final List<ChatBotMessage> _messages = [];
  final _scrollController = ScrollController();
  bool isDataInsideField = false;
  bool isResponseLoaded = false;

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
          screenContent: Column(
            children: [
              HeaderWithMenu(
                header: "AI Architect",
                scaffoldKey: scaffoldKey,
              ),
              if (_messages.isEmpty) const DataNotFound(),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    var message = _messages[index];
                    if (message.text.isEmpty) {
                      message.text = "Hmmmmmmmmmm";
                    }
                    return ChatMessageWidget(
                      message: message.text,
                      messageBy: message.messageBy,
                    );
                  },
                ),
              ),
              if (isResponseLoaded)
                LoadingAnimationWidget.staggeredDotsWave(
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: _questionTextController,
                        decoration: customDecorationForInput(
                          context,
                          "Get your Doubts solved by Artificial Intelligence.",
                          Icons.saved_search_rounded,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        }),
                  ),
                  IconButton(
                    onPressed: _messages.isEmpty
                        ? null
                        : () {
                            showModalBottomSheet(
                                backgroundColor: Colors.black,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                builder: (context) {
                                  return SizedBox(
                                    height: size.height * 0.4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Are you sure you wish to proceed with deleting the message?",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.cancel_rounded,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              title: Text(
                                                "Cancel",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _messages.clear();
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.delete_forever,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              title: Text(
                                                "Delete",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: _questionTextController.text.isEmpty
                        ? null
                        : () {
                            String input =
                                "$promptConstant ${_questionTextController.text}.";
                            setState(() {
                              _messages.add(ChatBotMessage(
                                text: _questionTextController.text,
                                messageBy: MessageBy.user,
                              ));
                              isResponseLoaded = true;
                            });
                            _questionTextController.clear();
                            Future.delayed(const Duration(milliseconds: 50))
                                .then((_) => _scrollDown());
                            generateResponse(input).then((value) {
                              setState(() {
                                _messages.add(ChatBotMessage(
                                  text: value,
                                  messageBy: MessageBy.bot,
                                ));
                                isResponseLoaded = false;
                              });
                              _questionTextController.clear();
                              Future.delayed(const Duration(milliseconds: 50))
                                  .then((_) => _scrollDown());
                            });
                          },
                    icon: Icon(
                      Icons.send_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
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

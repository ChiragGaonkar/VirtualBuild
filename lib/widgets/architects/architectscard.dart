import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/firebase/authentication.dart';
import 'package:virtualbuild/models/architects_model.dart';
import 'package:virtualbuild/providers/architects_provider.dart';
import 'package:virtualbuild/screens/architects/architect_detail_screen.dart';
import 'package:virtualbuild/screens/chats/chat_detail.dart';
import '../housemodels/modelscardbuttons.dart';
import '../housemodels/waveclipper.dart';

class ArchitectsCard extends StatefulWidget {
  final ArchitectModel architectData;
  const ArchitectsCard({super.key, required this.architectData});

  @override
  State<ArchitectsCard> createState() => _ArchitectsCardState();
}

class _ArchitectsCardState extends State<ArchitectsCard> {
  bool isExpanded = false;
  bool isFav = false;
  @override
  void initState() {
    checkIfFav();
    // TODO: implement initState
    super.initState();
  }

  checkIfFav() async {
    isFav = await Provider.of<ArchitectsProvider>(context, listen: false).checkFavArch(widget.architectData.architectID);
    return isFav;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ArchitectDetailScreen.routeName,
          arguments: widget.architectData,
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 20,
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.architectData.architectImageUrl.toString()),
                radius: 60,
              ),
            ),
          ),
          Container(
            width: 400,
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/starbg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: isExpanded == true ? WaveClipperUp() : WaveClipperDown(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: isExpanded == true ? 250 : 120,
                    child: GlassmorphicContainer(
                      width: 400,
                      height: isExpanded == true ? 250 : 120,
                      borderRadius: 20,
                      blur: 26,
                      border: 0,
                      linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                        const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                        const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      ], stops: const [
                        0.1,
                        1,
                      ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 20, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              icon: Icon(
                                isExpanded == true ? Icons.keyboard_double_arrow_down : Icons.keyboard_double_arrow_up_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 25,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.architectData.architectName,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "${widget.architectData.architectOfficeLocation['city']}, ${widget.architectData.architectOfficeLocation['state']}",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Expanded(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                children: [
                                  Text(
                                    "Registration No. ${widget.architectData.architectRegisterNum}",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    "${widget.architectData.architectType} Architect (${widget.architectData.architectExperience} years)",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ModelsCardButtons(
                                        buttontext: isFav ? "Unfavorite" : "Favorite",
                                        whatOnPressed: () async {
                                          setState(() {
                                            isFav = !isFav;
                                          });
                                          var fav = Provider.of<ArchitectsProvider>(context, listen: false);
                                          var list = await fav.getFavArchList();
                                          if (list.contains(widget.architectData.architectID)) {
                                            await fav.removeFavouriteArchitect(
                                              widget.architectData.architectID,
                                            );
                                          } else {
                                            await fav.addFavouriteArchitect(widget.architectData.architectID);
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                        height: 10,
                                      ),
                                      ModelsCardButtons(
                                        buttontext: "Message",
                                        whatOnPressed: () {
                                          //Get the Architects Id
                                          var aid = widget.architectData.architectID;

                                          //Get the Users Id
                                          final User? user = Auth().currentUser;
                                          var uid = user!.uid;

                                          //Route to the architects message page.
                                          Navigator.of(context).pushNamed(
                                            ChatDetail.routeName,
                                            arguments: {
                                              'aid': aid,
                                              'uid': uid,
                                              'name': widget.architectData.architectName,
                                              'imageUrl': widget.architectData.architectImageUrl,
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

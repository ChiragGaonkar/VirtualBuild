import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/firebase/authentication.dart';
import 'package:virtualbuild/screens/accounts/account_screen.dart';
import 'package:virtualbuild/screens/auth/login_screen.dart';
import 'package:virtualbuild/screens/botarchitect/bot_chats_screen.dart';
import 'package:virtualbuild/screens/chats/chats_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/screens/architects/explorearchitects_screen.dart';
import 'package:virtualbuild/screens/housemodels/exploremodels_screen.dart';
import 'package:virtualbuild/screens/favourites/favorites_screen.dart';
import '../providers/drawer_nav_provider.dart';
import '../providers/user_data_provider.dart';
import '../screens/auth/home_screen.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  //Code for retrieving data from firestore
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  //Code for retrieving data from firestore ends here

  Widget _buildListTile(
    String titleData,
    IconData iconData,
    bool isSelected,
  ) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        iconData,
        color: isSelected ? theme.primaryColor : theme.secondaryHeaderColor,
      ),
      title: Text(
        titleData,
        style: theme.textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: isSelected ? theme.primaryColor : theme.secondaryHeaderColor,
        ),
      ),
      tileColor: isSelected ? Colors.black.withOpacity(0.3) : Colors.transparent,
    );
  }

  widthOfMenuBar(width) {
    if (width < 450) {
      return width * 0.6;
    } else if (width < 1000) {
      return width * 0.4;
    } else {
      return width * 0.2;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userData = Provider.of<UserDataProvide>(context, listen: false);
    var highLighter = Provider.of<DrawerNavProvider>(context, listen: false);
    var navigatorVar = Navigator.of(context);
    String imageUrl = "";
    highLighter.changeHighLighter(ModalRoute.of(context)!.settings.name);
    return SizedBox(
      width: widthOfMenuBar(size.width),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                FutureBuilder(
                  future: userData.getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      String name = snapshot.data["name"];
                      String imageUrl = snapshot.data["imageUrl"];
                      return Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: LoadingAnimationWidget.waveDots(
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 20,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    //highLighter.highlightDrawerMenu(1);
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(DisplayScreen.routeName);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "Home",
                    Icons.home,
                    highLighter.isHome,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //highLighter.highlightDrawerMenu(2);
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(ExploreModelsScreen.routeName);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "Explore 3d Models",
                    Icons.threed_rotation_sharp,
                    highLighter.isModels,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //highLighter.highlightDrawerMenu(3);

                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(ExploreArchitectsScreen.routeName);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "Hire Architects",
                    Icons.people_alt_outlined,
                    highLighter.isArchitects,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //highLighter.highlightDrawerMenu(4);

                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(FavoritesScreen.routeName);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "Favorites",
                    Icons.favorite_rounded,
                    highLighter.isFavorites,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(ChatsScreen.routeName);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "Chats",
                    Icons.mark_chat_read_rounded,
                    highLighter.isChats,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(ChatWithBotScreen.routeName);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "AI Architect",
                    Icons.ac_unit_rounded,
                    highLighter.isAIArchitect,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //highLighter.highlightDrawerMenu(6);

                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(AccountScreen.routeName, arguments: {"": ""});
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "My Account",
                    Icons.account_circle,
                    highLighter.isAccount,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    await Auth().signOut();
                    navigatorVar.pushNamed(LoginScreen.routeName);
                  },
                  splashColor: Theme.of(context).primaryColor,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: _buildListTile(
                      "Log out",
                      Icons.logout_rounded,
                      false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

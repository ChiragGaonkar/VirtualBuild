import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/firebase/authentication.dart';
import 'package:virtualbuild/screens/accounts/account_screen.dart';
import 'package:virtualbuild/screens/chats/chats_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/screens/architects/explorearchitects_screen.dart';
import 'package:virtualbuild/screens/housemodels/exploremodels_screen.dart';
import 'package:virtualbuild/screens/favorites_screen.dart';
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
  bool _isSelected = false;

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
        color: Colors.white,
      ),
      title: Text(
        titleData,
        style: theme.textTheme.titleMedium,
      ),
      tileColor: isSelected ? theme.primaryColor : Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user_data = Provider.of<UserDataProvide>(context, listen: false);
    return SizedBox(
      width: size.width * 0.6,
      child: Scaffold(
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
        body: SafeArea(
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage("assets/Female.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  user_data.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isSelected = true;
                  });
                  Navigator.of(context).pushNamed(DisplayScreen.routeName);
                },
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Home",
                  Icons.home,
                  _isSelected,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(ExploreModelsScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Explore 3d Models",
                  Icons.threed_rotation_sharp,
                  _isSelected,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(ExploreArchitectsScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Hire Architects",
                  Icons.people_alt_outlined,
                  _isSelected,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(FavoritesScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Favorites",
                  Icons.favorite_rounded,
                  _isSelected,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(ChatsScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Chats",
                  Icons.mark_chat_read_rounded,
                  _isSelected,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(AccountScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "My Account",
                  Icons.account_circle,
                  _isSelected,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  await Auth().signOut();
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                splashColor: Theme.of(context).primaryColor,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "Log out",
                    Icons.logout_rounded,
                    _isSelected,
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

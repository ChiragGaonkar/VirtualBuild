import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/accounts/account_screen.dart';
import 'package:virtualbuild/screens/chats/chats_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/screens/architects/explorearchitects_screen.dart';
import 'package:virtualbuild/screens/housemodels/exploremodels_screen.dart';
import 'package:virtualbuild/screens/favorites_screen.dart';
import '../screens/auth/home_screen.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  Widget _buildListTile(String titleData, IconData iconData) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.white,
      ),
      title: Text(
        titleData,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              Text(
                "shreya@gmail.com",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(DisplayScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Home",
                  Icons.home,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(ExploreModelsScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Explore 3d Models",
                  Icons.threed_rotation_sharp,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(ExploreArchitectsScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Hire Architects",
                  Icons.people_alt_outlined,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(FavoritesScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Favorites",
                  Icons.favorite_rounded,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(ChatsScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "Chats",
                  Icons.mark_chat_read_rounded,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(AccountScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: _buildListTile(
                  "My Account",
                  Icons.account_circle,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(HomeScreen.routeName),
                splashColor: Theme.of(context).primaryColor,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: _buildListTile(
                    "Log out",
                    Icons.logout_rounded,
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

import 'package:flutter/material.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/headerwithmenu.dart';
import 'arch_fav.dart';
import 'model_fav.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  static const routeName = "/favorites";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const CustomMenu(),
        body: MyCustomScreen(
          // customColor: Colors.blue,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWithMenu(
                header: "Favorites",
                scaffoldKey: scaffoldKey,
              ),
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.groups,
                      color: Theme.of(context).primaryColor,
                    ),
                    text: "Architects",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.other_houses_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    text: "Models",
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ArchFav(),
                    ModelFav(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

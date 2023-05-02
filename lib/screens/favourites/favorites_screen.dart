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
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ModelFav(),
                    ArchFav(),
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

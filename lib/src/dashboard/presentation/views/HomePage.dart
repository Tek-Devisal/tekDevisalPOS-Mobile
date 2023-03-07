import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tekDevisalPOS/core/utils/colors.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/Returns.dart';
import 'package:tekDevisalPOS/src/dashboard/data/datasource/logout.dart';
import 'package:tekDevisalPOS/src/dashboard/data/models/dailySalesModel.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/Inventory.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/ReportsHome.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/Revenue.dart';
import 'package:tekDevisalPOS/src/dashboard/widgets/alertDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const id = '/dashboard';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              // Logout
              showAlertDialog(context, "Logout",
                  "Are you sure you want to logout? All local data would be lost.",
                  () {
                logout(context);
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/jesseProfile.jpg'),
              ),
            ),
          ),
          backgroundColor: TheColors.buttonColor,
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.notifications),
          //   )
          // ],
        ),
        /*drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: TheColors.buttonColor,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),*/
        bottomNavigationBar: const BottomAppBar(
          color: TheColors.buttonColor,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.money),
                text: 'Revenue',
              ),
              Tab(
                icon: Icon(Icons.store),
                text: 'Inventory',
              ),
              Tab(
                icon: Icon(Icons.reduce_capacity),
                text: 'Return',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ReportPage(),
            RevenuePage(),
            InventoryPage(),
            ReturnsPage(),
          ],
        ),
      ),
    );
  }
}

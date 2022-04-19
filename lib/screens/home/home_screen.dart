import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:jobappv2/auth_service.dart';
import 'package:jobappv2/screens/todo/widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/hs";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthServiceClass authServiceClass = AuthServiceClass();
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("Todo").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => authServiceClass.logOut(context),
              icon: Icon(Icons.logout),
            ),
            CircleAvatar(
              child: FittedBox(child: Text("Profile Photo")),
            ),
            SizedBox(
              width: 25,
            ),
          ],
          title: Text(
            "Today's Schedule",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Monday 21",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(35),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
                color: Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.red[900]!, Colors.yellow[900]!],
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 32,
                color: Colors.white,
              ),
              label: "",
            ),
          ],
        ),
        body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}

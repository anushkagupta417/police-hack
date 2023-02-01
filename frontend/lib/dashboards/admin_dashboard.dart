import 'dart:js';

import 'package:flutter/material.dart';
import 'package:frontend/views/signup_page.dart';

import '../views/home_page.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({Key? key}) : super(key: key);
  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(49, 87, 110, 1.0),
        title: Text('Admin Dashboard'),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()));
            },
            icon: const Icon(
              Icons.home,
              size: 20,
              color: Colors.grey,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            addUser("Add User", Icons.person_add),
            removeUser("Remove User", Icons.delete),
            // makeDashboardItem("Remove User", Icons.delete),
            // makeDashboardItem("Alphabet", Icons.alarm),
            // makeDashboardItem("Alphabet", Icons.alarm),
            // makeDashboardItem("Alphabet", Icons.alarm),
            // makeDashboardItem("Alphabet", Icons.alarm)
          ],
        ),
      ),
    );
  }
}

Card addUser(String title, IconData icon) {
  return Card(
      elevation: 1.0,
      margin: EdgeInsets.all(120.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          );
        }),
      ));
}

Card removeUser(String title, IconData icon) {
  return Card(
      elevation: 1.0,
      margin: EdgeInsets.all(120.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: Builder(builder: (context) {
          return InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          );
        }),
      ));
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/services/user_api.dart';

class GetResults extends StatefulWidget {
  const GetResults({Key? key}) : super(key: key);

  @override
  State<GetResults> createState() => _GetResultsState();
}

class _GetResultsState extends State<GetResults> {
  @override
  Widget build(BuildContext context) {
    String report = "Report will be diplayed here";
    return Scaffold(
        appBar: AppBar(
          title: Text("Here for results"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              ElevatedButton(
                child: Text("Generate"),
                onPressed: () async {
                  var resp = await UserApi().displayResults();
                  setState(() {
                    report = resp['Report'];
                    print(report);
                  });
                },
              ),
              Container(child: Text(report)),
            ],
          )),
        ));
  }
}

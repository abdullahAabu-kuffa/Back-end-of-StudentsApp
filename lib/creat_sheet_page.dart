import 'package:flutter/material.dart';
import 'package:p1/main.dart';
import 'package:p1/user.dart';
import 'package:p1/user_from_widget.dart';
import 'package:p1/user_sheets_api.dart';

class CreatSheetsPage extends StatefulWidget {
  const CreatSheetsPage({super.key});

  @override
  State<CreatSheetsPage> createState() => _CreatSheetsPageState();
}

class _CreatSheetsPageState extends State<CreatSheetsPage> {
  User? user1;
  @override
  void initState(){
    super.initState();
    // getUsers();
  }
  // Future getUsers()async{
  //   final user = await UserSheetsApi.getById(120190025);
  // setState(() {
  //   this.user1=user;
  // });
  // }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: UserFromWidget(
                user:user1,
                onSavedUser: (user) async {
                  // await UserSheetsApi.insert([user.toJson()]);
                  final user1 =await UserSheetsApi.getById(int.parse(user.id));
                    // ignore: avoid_print
                    print(user1!.toJson());
                  
                },
              ),
            )),
      );
}

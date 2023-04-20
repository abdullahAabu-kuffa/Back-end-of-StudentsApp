import 'package:flutter/material.dart';
import 'package:p1/creat_sheet_page.dart';
import 'package:p1/user_sheets_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Google Sheets API';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home:const CreatSheetsPage(),
    // Scaffold(
    //   backgroundColor: Colors.blueGrey[900],
    //   appBar: AppBar(
    //     backgroundColor: Colors.blueGrey[600],
    //     title: const Text('data'),
    //   ),
    //   body: Column(
    //     children: [
    //       Container(
    //         color: Colors.blue[300],
    //         child: ElevatedButton(
    //           onPressed: () {},
    //           child: const Text('save'),
    //         ),
    //       )
    //     ],
    //   ),
    // ),
  );
}
import 'package:flutter/material.dart';
import 'package:menu_programas/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home:const  HomePage(),
        theme: ThemeData.dark(),
        );
  }

}

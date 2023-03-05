import 'package:flutter/material.dart';
import 'package:menu_programas/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Menu aplicacion',
        home:const  HomePage(),
        theme: ThemeData.dark(),
        );
  }

}

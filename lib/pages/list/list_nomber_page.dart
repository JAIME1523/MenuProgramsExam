import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:menu_programas/pages/pages.dart';

class ListNumberPage extends StatelessWidget {
  const ListNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) {
            return FadeInLeft(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => NumberPage(
                                number: index,
                              )));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.grey,
                  height: 70,
                  width: double.infinity,
                  child: ListTile(
                    trailing:
                        const Icon(FontAwesomeIcons.plus, color: Colors.black87),
                    title: Text(
                      '$index',
                      style: const TextStyle(color: Colors.red, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    leading: const FaIcon(
                      FontAwesomeIcons.minus,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
        )),
      ),
    );
  }
}

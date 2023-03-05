import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:menu_programas/pages/pages.dart';
import 'package:menu_programas/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BotonCustom(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const HoursWorkedPage()));
                  },
                  texto: 'Horas trabajadas',
                  icon: FontAwesomeIcons.businessTime),
              BotonCustom(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => const CircleAreaPage()));
                },
                texto: 'Área de un círculo',
              ),
              BotonCustom(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const ListNumberPage()));
                  },
                  texto: 'Lista de numeros',
                  icon: FontAwesomeIcons.list)
            ],
          ),
        ),
      ),
    );
  }
}

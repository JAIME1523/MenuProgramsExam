import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:menu_programas/provider/provider.dart';
import 'package:menu_programas/widget/widget.dart';

class CircleAreaPage extends StatelessWidget {
  const CircleAreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Area y Perimetro de un círculo'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => CircleProvider(), child: const _BodyPage()));
  }
}

class _BodyPage extends StatelessWidget {
  const _BodyPage();

  @override
  Widget build(BuildContext context) {
    final providerCirculo = Provider.of<CircleProvider>(context);
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            const Spacer(),
            _FormDiame(providerCirculo: providerCirculo),
            providerCirculo.canShow
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowInfo(
                          title: 'Área',
                          data: providerCirculo.area.toStringAsPrecision(7),
                        ),
                        RowInfo(
                          title: 'Perímetro',
                          data:
                              providerCirculo.perimeter.toStringAsPrecision(7),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            ElevatedButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  providerCirculo.validateFrom();
                },
                child: const Text('Calcular')),
            const Spacer(),
            const Spacer(),
          ],
        ));
  }
}

class _FormDiame extends StatelessWidget {
  const _FormDiame({
    required this.providerCirculo,
  });

  final CircleProvider providerCirculo;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: providerCirculo.formKey,
      child: Column(
        children: [
          const Text(
            'Ingrese el valor del diámetro',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomImput(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardRype: TextInputType.number,
            validator: (value) {
              if (value == '') {
                return 'Ingresa datos ';
              }

              return null;
            },
            icon: FontAwesomeIcons.circle,
            placeholder: 'Diámetro',
            onChanged: (value) {
              providerCirculo.canShow = false;
              providerCirculo.diameterValue = value;
            },
          ),
        ],
      ),
    );
  }
}

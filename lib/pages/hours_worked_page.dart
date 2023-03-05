import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:menu_programas/provider/provider.dart';
import 'package:menu_programas/widget/widget.dart';
import 'package:provider/provider.dart';

class HoursWorkedPage extends StatelessWidget {
  const HoursWorkedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HoursProvider(),
      child: Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (context) {
          final providerHours = Provider.of<HoursProvider>(context);
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  _FormHours(providerHours: providerHours),
                  ElevatedButton(
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        final resp = providerHours.validateFrom();
                        if (resp == true) {
                          showDialog(
                              context: context,
                              builder: (_) => _AlertWork(
                                    providerHours: providerHours,
                                  ));
                        }
                      },
                      child: const Text('Calcular salario')),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _AlertWork extends StatelessWidget {
  const _AlertWork({
    super.key,
    required this.providerHours,
  });
  final HoursProvider providerHours;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok')),
      ],
      title: const Text('CÁLCULO DE SALARIO'),
      content: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RowInfo(
              title: 'Horas',
              data: providerHours.horasTotales,
            ),
            RowInfo(
              title: 'Monto',
              data: providerHours.salary.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormHours extends StatelessWidget {
  const _FormHours({
    required this.providerHours,
  });

  final HoursProvider providerHours;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: providerHours.formKey,
      child: Column(
        children: [
          const Text(
            'Ingrese el total de horas trabajadas',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomImput(
          
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,

            ],
            keyboardRype: TextInputType.number,
            validator: (value) {
              if (value == '') {
                return 'Ingresa datos';
              }

              return null;
            },
            icon: FontAwesomeIcons.businessTime,
            placeholder: 'Horas',
            onChanged: (value) {
              providerHours.horasTotales = value;
            },
          ),
        ],
      ),
    );
  }
}

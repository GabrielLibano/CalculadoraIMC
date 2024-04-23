import 'package:calculadora_imc/calculadora.dart';

import '../components/bottom_button.dart';
import '../components/contador.dart';
import '../components/custom_card.dart';
import '../components/gender_content.dart';
import '../components/modal_result.dart';

import '../components/slider_altura.dart';

import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  bool masc = false;
  bool fem = false;
  int altura = 120;
  int idade = 18;
  int peso = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        masc = true;
                        fem = false;
                      });
                    },
                    child: CustomCard(
                      active: masc,
                      child: GenderContent(
                        icon: Icons.male,
                        label: 'Masculino',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        masc = false;
                        fem = true;
                      });
                    },
                    child: CustomCard(
                      active: fem,
                      child: GenderContent(
                        icon: Icons.female,
                        label: 'Feminino',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              child: SliderAltura(
                altura: altura.toDouble(),
                onChanged: (double novaAltura) {
                  setState(() {
                    altura = novaAltura.toInt();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                      child: Contador(
                    label: 'Peso',
                    value: peso,
                    onIncrement: () {
                      setState(() {
                        peso++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        peso--;
                      });
                    },
                  )),
                ),
                Expanded(
                  child: CustomCard(
                      child: Contador(
                    label: 'Idade',
                    value: idade,
                    onIncrement: () {
                      setState(() {
                        idade++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        idade--;
                      });
                    },
                  )),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calcular IMC',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  final imc =
                      Calculadora.calcularIMC(peso: peso, altura: altura);
                  final resultado = Calculadora.obterResultado(imc);
                  return ModalResult(imc: imc, resultado: resultado);
                },
              );
            },
          )
        ],
      ),
    );
  }
}

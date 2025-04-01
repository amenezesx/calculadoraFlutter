import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController _controllerNum1 = TextEditingController();
  final TextEditingController _controllerNum2 = TextEditingController();
  String _resultado = 'Resultado aparecerá aqui';

  void _calcular(String operacao) {
    double num1 = double.parse(_controllerNum1.text);
    double num2 = double.parse(_controllerNum2.text);
    double resultado;

    switch (operacao) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '*':
        resultado = num1 * num2;
        break;
      case '/':
        resultado = num1 / num2;
        break;
      default:
        resultado = 0;
    }

    setState(() {
      _resultado = 'Resultado: $resultado';
    });
  }

  void _limpar() {
    setState(() {
      _controllerNum1.clear();
      _controllerNum2.clear();
      _resultado = 'Resultado aparecerá aqui';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'), backgroundColor: const Color.fromARGB(255, 139, 213, 247),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network("https://images.vexels.com/media/users/3/205996/isolated/preview/81d3f60bca6d3b2cbef6ba1ff1e0b4f7-desenho-de-calculadora-fofo.png", width: 200,),
            TextField(
              controller: _controllerNum1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controllerNum2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calcular('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('/'),
                  child: Text('/'),
                ),
                ElevatedButton(
                  onPressed: _limpar,
                  child: Text('Limpar'),

                  ),
                
              ],
            ),
            SizedBox(height: 24),
            Text(
              _resultado,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerNum1.dispose();
    _controllerNum2.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 81;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 10,
          centerTitle: true,
          title: Text(
            "CURRENCY_CONVERTER",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)} ',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                TextField(
                  controller: textEditingController,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  decoration: const InputDecoration(
                    hintText: "enter the amount in USD:",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    prefixIcon: Icon(Icons.monetization_on),
                    prefixIconColor: Colors.blue,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    convert();
                  },
                  style: TextButton.styleFrom(
                      elevation: 15,
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: (RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    "convert",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

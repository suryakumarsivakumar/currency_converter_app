import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
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
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemPink,
          middle: Text(
            "CURRENCY_CONVERTER",
            style: TextStyle(color: CupertinoColors.systemBlue),
          ),
        ),
        backgroundColor: CupertinoColors.white,
        child: Center(
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
                    color: CupertinoColors.systemPink,
                  ),
                ),
                CupertinoTextField(
                  placeholder: "enter the amount in USD",
                  prefix: Icon(CupertinoIcons.money_dollar),
                  controller: textEditingController,
                  style: TextStyle(
                    color: CupertinoColors.systemBlue,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                    color: CupertinoColors.white,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
                const SizedBox(height: 5),
                CupertinoButton(
                  onPressed: () {
                    convert();
                  },
                  color: CupertinoColors.white,
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
